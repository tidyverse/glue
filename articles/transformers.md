# Transformers

Transformers allow you to apply functions to the glue input and output,
before and after evaluation. This allows you to write things like
[`glue_sql()`](https://glue.tidyverse.org/reference/glue_sql.md), which
automatically quotes variables for you or add a syntax for automatically
collapsing outputs.

The transformer functions simply take two arguments `text` and `envir`,
where `text` is the unparsed string inside the glue block and `envir` is
the execution environment. Most transformers will then call
`eval(parse(text = text, keep.source = FALSE), envir)` which parses and
evaluates the code.

You can then supply the transformer function to glue with the
`.transformer` argument. In this way users can manipulate the text
before parsing and change the output after evaluation.

It is often useful to write a
[`glue()`](https://glue.tidyverse.org/reference/glue.md) wrapper
function which supplies a `.transformer` to
[`glue()`](https://glue.tidyverse.org/reference/glue.md) or
[`glue_data()`](https://glue.tidyverse.org/reference/glue.md) and
potentially has additional arguments. One important consideration when
doing this is to include `.envir = parent.frame()` in the wrapper to
ensure the evaluation environment is correct.

Some example implementations of potentially useful transformers follow.
The aim right now is not to include most of these custom functions
within the `glue` package. Rather, users are encouraged to create custom
functions using transformers to fit their individual needs.

``` r
library(glue)
```

### collapse transformer

A transformer which automatically collapses any glue block ending with
`*`.

``` r
collapse_transformer <- function(regex = "[*]$", ...) {
  function(text, envir) {
    collapse <- grepl(regex, text)
    if (collapse) {
      text <- sub(regex, "", text)
    }
    res <- identity_transformer(text, envir)
    if (collapse) {
      glue_collapse(res, ...)
    } else {
      res
    }
  }
}

glue("{1:5*}\n{letters[1:5]*}", .transformer = collapse_transformer(sep = ", "))
#> 1, 2, 3, 4, 5
#> a, b, c, d, e

glue(
  "{1:5*}\n{letters[1:5]*}",
  .transformer = collapse_transformer(sep = ", ", last = " and ")
)
#> 1, 2, 3, 4 and 5
#> a, b, c, d and e

x <- c("one", "two")
glue("{x}: {1:5*}", .transformer = collapse_transformer(sep = ", "))
#> one: 1, 2, 3, 4, 5
#> two: 1, 2, 3, 4, 5
```

### Shell quoting transformer

A transformer which automatically quotes variables for use in shell
commands, e.g. via [`system()`](https://rdrr.io/r/base/system.html) or
[`system2()`](https://rdrr.io/r/base/system2.html).

``` r
shell_transformer <- function(type = c("sh", "csh", "cmd", "cmd2")) {
  type <- match.arg(type)
  function(text, envir) {
    res <- identity_transformer(text, envir)
    shQuote(res)
  }
}

glue_sh <- function(
  ...,
  .envir = parent.frame(),
  .type = c("sh", "csh", "cmd", "cmd2")
) {
  .type <- match.arg(.type)
  glue(..., .envir = .envir, .transformer = shell_transformer(.type))
}

filename <- "test"
writeLines(con = filename, "hello!")

command <- glue_sh("cat {filename}")
command
#> cat 'test'
system(command)
```

### emoji transformer

A transformer which converts the text to the equivalent emoji. This uses
the [emoji](https://emilhvitfeldt.github.io/emoji/) package.

``` r
emoji_transformer <- function(text, envir) {
  if (grepl("[*]$", text)) {
    text <- sub("[*]$", "", text)
    glue_collapse(emoji::emoji_find(text)$emoji)
  } else {
    emoji::emoji(text)
  }
}

glue_ji <- function(..., .envir = parent.frame()) {
  glue(
    ...,
    .open = ":",
    .close = ":",
    .envir = .envir,
    .transformer = emoji_transformer
  )
}
glue_ji("one :heart:")
#> one ❤️
glue_ji("many :heart*:")
#> many 🥰😘😻💌💘💝💖💗💓💞💕💟❣️💔❤️‍🔥❤️‍🩹❤️🩷🧡💛💚💙🩵💜🤎🖤🩶🤍💋🫰🫶🫀💏👩‍❤️‍💋‍👨👨‍❤️‍💋‍👨👩‍❤️‍💋‍👩💑👩‍❤️‍👨👨‍❤️‍👨👩‍❤️‍👩🏠🏡♥️🩺
```

### sprintf transformer

A transformer which allows succinct `sprintf` format strings.

``` r
sprintf_transformer <- function(text, envir) {
  m <- regexpr(":.+$", text)
  if (m != -1) {
    format <- substring(regmatches(text, m), 2)
    regmatches(text, m) <- ""
    res <- identity_transformer(text, envir)
    do.call(sprintf, list(glue("%{format}"), res))
  } else {
    identity_transformer(text, envir)
  }
}

glue_fmt <- function(..., .envir = parent.frame()) {
  glue(..., .transformer = sprintf_transformer, .envir = .envir)
}
glue_fmt("π = {pi:.3f}")
#> π = 3.142
```

### signif transformer

A transformer generator that represents numbers with a given number of
significant digits. This is useful if we want to represent all numbers
using the same significant digits

``` r
signif_transformer <- function(digits = 3) {
  force(digits)
  function(text, envir) {
    x <- identity_transformer(text, envir)
    if (is.numeric(x)) {
      signif(x, digits = digits)
    } else {
      x
    }
  }
}
glue_signif <- function(..., .envir = parent.frame()) {
  glue(..., .transformer = signif_transformer(3), .envir = .envir)
}

glue_signif("π = {pi}; 10π = {10*pi}; 100π = {100*pi}")
#> π = 3.14; 10π = 31.4; 100π = 314
```

### safely transformer

A transformer that acts like
[`purrr::safely()`](https://purrr.tidyverse.org/reference/safely.html),
which returns a value instead of an error.

``` r
safely_transformer <- function(otherwise = NA) {
  function(text, envir) {
    tryCatch(
      identity_transformer(text, envir),
      error = function(e) {
        if (is.language(otherwise)) eval(otherwise) else otherwise
      }
    )
  }
}

glue_safely <- function(..., .otherwise = NA, .envir = parent.frame()) {
  glue(..., .transformer = safely_transformer(.otherwise), .envir = .envir)
}

# Default returns missing if there is an error
glue_safely("foo: {xyz}")
#> foo: NA

# Or a custom string
glue_safely("foo: {xyz}", .otherwise = "Oops, something went wrong!")
#> foo: Oops, something went wrong!

# Or inline the error message
glue_safely(
  "foo: {xyz}",
  .otherwise = quote(glue("Error: {conditionMessage(e)}"))
)
#> foo: Error: Failed to evaluate glue component {xyz}
#> Caused by error:
#> ! object 'xyz' not found
```

### “Variables and Values” transformer

A transformer that expands input of the form `{var_name=}` into
`var_name = var_value`, i.e. a shorthand for exposing variable names
with their values. This is inspired by the [debug
specifier](https://docs.python.org/3/reference/lexical_analysis.html#f-strings)
in Python’s f-strings.

``` r
vv_transformer <- function(text, envir) {
  regex <- "=$"
  if (!grepl(regex, text)) {
    return(identity_transformer(text, envir))
  }

  text <- sub(regex, "", text)
  res <- identity_transformer(text, envir)
  n <- length(res)
  res <- glue_collapse(res, sep = ", ")
  if (n > 1) {
    res <- c("[", res, "]")
  }
  glue_collapse(c(text, " = ", res))
}
```

``` r
set.seed(1234)
description <- "some random"
numbers <- sample(100, 4)
average <- mean(numbers)
sum <- sum(numbers)

glue(
  "For {description} {numbers=}, {average=}, {sum=}.",
  .transformer = vv_transformer
)
#> For some random numbers = [28, 80, 22, 9], average = 34.75, sum = 139.
```

This transformer is actually more general than just reporting a
variable’s value. For example, we can use it to report the text and
value of a more complex expression like `a * 9 + b * 2`:

``` r
a <- 3
b <- 5.6
glue("{a=}\n{b=}\n{a * 9 + b * 2=}", .transformer = vv_transformer)
#> a = 3
#> b = 5.6
#> a * 9 + b * 2 = 38.2
```
