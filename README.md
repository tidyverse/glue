
<!-- README.md is generated from README.Rmd. Please edit that file -->

# glue <a href="https://glue.tidyverse.org"><img src="man/figures/logo.png" align="right" height="138" alt="glue website" /></a>

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/glue)](https://cran.r-project.org/package=glue)
[![R-CMD-check](https://github.com/tidyverse/glue/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tidyverse/glue/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/tidyverse/glue/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/tidyverse/glue/actions/workflows/test-coverage.yaml)
<!-- badges: end -->

glue offers interpreted string literals that are small, fast, and
dependency-free. glue does this by embedding R expressions in curly
braces, which are then evaluated and inserted into the string.

## Installation

<div class=".pkgdown-release">

``` r
# Install released version from CRAN
install.packages("glue")
```

</div>

<div class=".pkgdown-devel">

``` r
# Install development version from GitHub
pak::pak("tidyverse/glue")
```

</div>

## Usage

`glue()` makes it easy to interpolate data into strings:

``` r
library(glue)

name <- "Fred"
glue("My name is {name}.")
#> My name is Fred.
```

`stringr::str_glue()` is an alias for `glue::glue()`. So if you’ve
already attached stringr (or perhaps the whole tidyverse), you can use
`str_glue()` to access all of the functionality of `glue()`:

``` r
library(stringr) # or library(tidyverse)

name <- "Wilma"
str_glue("My name is {name}.")
#> My name is Wilma.
```

You’re not limited to using a bare symbol inside `{}`; it can be any
little bit of R code:

``` r
name <- "Pebbles"
glue("Here is my name in uppercase and doubled: {strrep(toupper(name), 2)}.")
#> Here is my name in uppercase and doubled: PEBBLESPEBBLES.
```

### Data can come from various sources

glue can interpolate values from the local environment or from data
passed in `name = value` form:

``` r
x <- "the local environment"
glue(
  "`glue()` can access values from {x} or from {y}. {z}",
  y = "named arguments",
  z = "Woo!"
)
#> `glue()` can access values from the local environment or from named arguments. Woo!
```

If the relevant data lives in a data frame (or list or environment), use
`glue_data()` instead:

``` r
mini_mtcars <- head(cbind(model = rownames(mtcars), mtcars))
glue_data(mini_mtcars, "{model} has {hp} hp.")
#> Mazda RX4 has 110 hp.
#> Mazda RX4 Wag has 110 hp.
#> Datsun 710 has 93 hp.
#> Hornet 4 Drive has 110 hp.
#> Hornet Sportabout has 175 hp.
#> Valiant has 105 hp.
```

`glue_data()` is very natural to use with the pipe:

``` r
mini_mtcars |>
  glue_data("{model} gets {mpg} miles per gallon.")
#> Mazda RX4 gets 21 miles per gallon.
#> Mazda RX4 Wag gets 21 miles per gallon.
#> Datsun 710 gets 22.8 miles per gallon.
#> Hornet 4 Drive gets 21.4 miles per gallon.
#> Hornet Sportabout gets 18.7 miles per gallon.
#> Valiant gets 18.1 miles per gallon.
```

These `glue_data()` examples also demonstrate that `glue()` is
vectorized over the data.

### What you see is awfully close to what you get

`glue()` lets you write code that makes it easy to predict what the
final string will look like. There is considerably less syntactical
noise and mystery compared to `paste()` and `sprintf()`.

Empty first and last lines are automatically trimmed, as is leading
whitespace that is common across all lines. You don’t have to choose
between indenting your code properly and getting the output you actually
want. Consider what happens when `glue()` is used inside the body of a
function:

``` r
foo <- function() {
  glue("
    A formatted string
    Can have multiple lines
      with additional indention preserved")
}
foo()
#> A formatted string
#> Can have multiple lines
#>   with additional indention preserved
```

The leading whitespace that is common to all 3 lines is absent from the
result.

## Learning more

glue is a relatively small and focused package, but there’s more to it
than the basic usage of `glue()` and `glue_data()` shown here. More
recommended functions and resources:

- The “Get started” article (`vignette("glue")`) demonstrates more
  interesting features of `glue()` and `glue_data()`.
- `glue_sql()` and `glue_data_sql()` are specialized functions for
  producing SQL statements.
- glue provides a couple of custom knitr engines that allow you to use
  glue syntax in chunks; learn more in
  `vignette("engines", package = "glue")`.

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](https://glue.tidyverse.org/CODE_OF_CONDUCT.html). By
participating in this project, you agree to abide by its terms.
