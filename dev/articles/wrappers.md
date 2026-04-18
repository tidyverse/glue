# How to write a function that wraps glue

``` r
library(glue)
```

Imagine that you want to call
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) repeatedly
inside your own code (e.g. in your own package) with a non-default value
for one or more arguments. For example, maybe you anticipate producing R
code where `{` and `}` have specific syntactic meaning. Therefore, you’d
prefer to use `<<` and `>>` as the opening and closing delimiters for
expressions in
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md).

Spoiler alert: here’s the correct way to write such a wrapper:

``` r
my_glue <- function(..., .envir = parent.frame()) {
  glue(..., .open = "<<", .close = ">>", .envir = .envir)
}
```

This is the key move:

> Include `.envir = parent.frame()` as an argument of the wrapper
> function and pass this `.envir` to the `.envir` argument of
> [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md).

If you’d like to know why this is the way, keep reading. It pays off to
understand this, because the technique applies more broadly than glue.
Once you recognize this setup, you’ll see it in many functions in the
withr, cli, and rlang packages
(e.g. [`withr::defer()`](https://withr.r-lib.org/reference/defer.html),
[`cli::cli_abort()`](https://cli.r-lib.org/reference/cli_abort.html),
[`rlang::abort()`](https://rlang.r-lib.org/reference/abort.html)).

## Working example

Here’s an abbreviated excerpt of the roxygen comment that generates the
documentation for the starwars dataset in dplyr
([`?dplyr::starwars`](https://dplyr.tidyverse.org/reference/starwars.html)):

``` r
#' \describe{
#' \item{name}{Name of the character}
#' \item{height}{Height (cm)}
#' \item{mass}{Weight (kg)}
#' \item{species}{Name of species}
#' \item{films}{List of films the character appeared in}
#' }
```

To produce such text programmatically, the first step might be to
generate the `\item{}{}` lines from a named character vector of column
names and descriptions. Notice that `{` and `}` are important to the
`\describe{...}` and `\item{}{}` syntax, so this is an example where it
is nice for glue to use different delimiters for expressions.

Put the metadata in a suitable vector:

``` r
sw_meta <- c(
  name = "Name of the character",
  height = "Height (cm)",
  mass = "Weight (kg)",
  species = "Name of species",
  films = "List of films the character appeared in"
)
```

Define a custom glue wrapper and use it inside another helper that
generates `\item` entries[¹](#fn1):

``` r
my_glue <- function(..., .envir = parent.frame()) {
  glue(..., .open = "<<", .close = ">>", .envir = .envir)
}

named_chr_to_items <- function(x) {
  my_glue("\\item{<<names(x)>>}{<<x>>}")
}
```

Apply `named_chr_to_items()` to starwars metadata:

``` r
named_chr_to_items(sw_meta)
#> \item{name}{Name of the character}
#> \item{height}{Height (cm)}
#> \item{mass}{Weight (kg)}
#> \item{species}{Name of species}
#> \item{films}{List of films the character appeared in}
```

Here’s how this would fail if we did *not* handle `.envir` correctly in
our wrapper function:

``` r
my_glue_WRONG <- function(...) {
  glue(..., .open = "<<", .close = ">>")
}

named_chr_to_items_WRONG <- function(x) {
  my_glue_WRONG("\\item{<<names(x)>>}{<<x>>}")
}

named_chr_to_items_WRONG(sw_meta)
#> Error:
#> ! Failed to evaluate glue component {names(x)}
#> Caused by error:
#> ! object 'x' not found
```

It can be hard to understand why `x` can’t be found, when it is clearly
available inside `named_chr_to_items_WRONG()`. Why isn’t `x` available
to `my_glue_WRONG()`?

## Where does `glue()` evaluate code?

What’s going on? It’s time to look at the (redacted) signature of
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md):

``` r
glue(..., .envir = parent.frame(), ...)
```

The expressions inside a glue string are evaluated with respect to
`.envir`, which defaults to the environment where
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) is called
from.

Everything is simple when evaluating
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) in the
global environment:

``` r
x <- 0
y <- 0
z <- 0

glue("{x} {y} {z}")
#> 0 0 0
```

Now we wrap [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md)
in our own simple function, `my_glue1()`. Notice that `my_glue1()` does
not capture its caller environment and pass that along.

When we execute `my_glue1()` in the global environment, there’s no
obvious problem.

``` r
my_glue1 <- function(...) {
  x <- 1
  glue(...)
}

my_glue1("{x} {y} {z}")
#> 1 0 0
```

The value of `x` is found in the execution environment of `my_glue1()`.
The values of `y` and `z` are found in the global environment.
Importantly, this is because that is the environment where `my_glue1()`
is defined, not because that is where `my_glue1()` is called.

However, if we call our `my_glue1()` inside another function, we see
that all is not well.

``` r
my_glue2 <- function(...) {
  x <- 2
  y <- 2
  my_glue1(...)
}

my_glue2("{x} {y} {z}")
#> 1 0 0
```

Why do `x` and `y` not have the value 2? Because `my_glue1()` and its
eventual call to
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) have no
access to the execution environment of `my_glue2()`, which is the caller
environment of `my_glue1()`.

If you want your glue wrapper to behave like
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) itself and
to work as expected inside other functions, make sure it captures its
caller environment and passes that along to
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md).

``` r
my_glue3 <- function(..., .envir = parent.frame()) {
  x <- 3
  glue(..., .envir = .envir)
}

my_glue3("{x} {y} {z}")
#> 0 0 0

my_glue4 <- function(...) {
  x <- 4
  y <- 4
  my_glue3(...)
}

my_glue4("{x} {y} {z}")
#> 4 4 0
```

------------------------------------------------------------------------

1.  Note that delimiters `<<` and `>>` have special meaning in knitr
    (they are used for a templating feature in knitr itself). So in code
    chunks inside RMarkdown or Quarto documents, you may need to use
    different delimiters.
