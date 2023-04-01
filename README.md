
<!-- README.md is generated from README.Rmd. Please edit that file -->

# glue <a href='https://glue.tidyverse.org'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/glue)](https://cran.r-project.org/package=glue)
[![R-CMD-check](https://github.com/tidyverse/glue/actions/workflows/.github/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tidyverse/glue/actions/workflows/.github/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/tidyverse/glue/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/tidyverse/glue/actions/workflows/test-coverage.yaml)
<!-- badges: end -->

## Overview

Glue offers interpreted string literals that are small, fast, and
dependency-free. Glue does this by embedding R expressions in curly
braces which are then evaluated and inserted into the argument string.

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
devtools::install_github("tidyverse/glue")
```

</div>

## Usage

`glue()` makes it easy to interpolate data into strings:

``` r
library(glue)

name <- "Fred"
glue('My name is {name}.')
#> My name is Fred.

# A literal brace is inserted by using doubled braces.
name <- "Fred"
glue("My name is {name}, not {{name}}.")
#> My name is Fred, not {name}.
```

`glue::glue()` is also made available via `stringr::str_glue()`. So if
you’ve already attached stringr (or perhaps the whole tidyverse), you
can access `glue()` like so:

``` r
library(stringr) # or library(tidyverse)

stringr_fcn <- "`stringr::str_glue()`"
glue_fcn    <- "`glue::glue()`"

str_glue('{stringr_fcn} is essentially an alias for {glue_fcn}.')
#> `stringr::str_glue()` is essentially an alias for `glue::glue()`.
```

`glue_data()` works well with pipes:

``` r
mtcars$model <- rownames(mtcars)
mtcars |> head() |> glue_data("{model} has {hp} hp")
#> Mazda RX4 has 110 hp
#> Mazda RX4 Wag has 110 hp
#> Datsun 710 has 93 hp
#> Hornet 4 Drive has 110 hp
#> Hornet Sportabout has 175 hp
#> Valiant has 105 hp
```

`glue_sql()` makes constructing SQL statements safe and easy. Use
backticks to quote identifiers, normal strings and numbers are quoted
appropriately for your backend.

``` r
con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
colnames(iris) <- gsub("[.]", "_", tolower(colnames(iris)))
DBI::dbWriteTable(con, "iris", iris)

var <- "sepal_width"
tbl <- "iris"
num <- 2
val <- "setosa"
glue_sql("
  SELECT {`var`}
  FROM {`tbl`}
  WHERE {`tbl`}.sepal_length > {num}
    AND {`tbl`}.species = {val}
  ", .con = con)
#> <SQL> SELECT `sepal_width`
#> FROM `iris`
#> WHERE `iris`.sepal_length > 2
#>   AND `iris`.species = 'setosa'
```

Learn more in `vignette("glue")`.

# Other implementations

Some other implementations of string interpolation in R (although not
using identical syntax).

- [stringr::str_interp](https://stringr.tidyverse.org/reference/str_interp.html)
- [R.utils::gstring](https://cran.r-project.org/package=R.utils)
- [rprintf](https://cran.r-project.org/package=rprintf)

String templating is closely related to string interpolation, although
not exactly the same concept. Some packages implementing string
templating in R include.

- [whisker](https://cran.r-project.org/package=whisker)
- [brew](https://cran.r-project.org/package=brew)
- [jinjar](https://cran.r-project.org/package=jinjar)

## Code of Conduct

Please note that the glue project is released with a [Contributor Code
of Conduct](https://glue.tidyverse.org/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
