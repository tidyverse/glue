
<!-- README.md is generated from README.Rmd. Please edit that file -->

# glue <a href="https://glue.tidyverse.org"><img src="man/figures/logo.png" align="right" height="138" alt="glue website" /></a>

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/glue)](https://cran.r-project.org/package=glue)
[![R-CMD-check](https://github.com/tidyverse/glue/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tidyverse/glue/actions/workflows/R-CMD-check.yaml)
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
pak::pak("tidyverse/glue")
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

##### `glue_data()` is useful with [magrittr](https://cran.r-project.org/package=magrittr) pipes.

``` r
`%>%` <- magrittr::`%>%`
head(mtcars) %>% glue_data("{rownames(.)} has {hp} hp")
#> Mazda RX4 has 110 hp
#> Mazda RX4 Wag has 110 hp
#> Datsun 710 has 93 hp
#> Hornet 4 Drive has 110 hp
#> Hornet Sportabout has 175 hp
#> Valiant has 105 hp
```

##### `glue()` is useful within dplyr pipelines

``` r
library(dplyr)
head(iris) %>%
  mutate(description = glue("This {Species} has a petal length of {Petal.Length}"))
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa
#>                             description
#> 1 This setosa has a petal length of 1.4
#> 2 This setosa has a petal length of 1.4
#> 3 This setosa has a petal length of 1.3
#> 4 This setosa has a petal length of 1.5
#> 5 This setosa has a petal length of 1.4
#> 6 This setosa has a petal length of 1.7
```

##### Leading whitespace and blank lines from the first and last lines are automatically trimmed.

This lets you indent the strings naturally in code.

``` r
glue("
    A formatted string
    Can have multiple lines
      with additional indention preserved
    ")
#> A formatted string
#> Can have multiple lines
#>   with additional indention preserved
```

##### An additional newline can be used if you want a leading or trailing newline.

``` r
glue("

  leading or trailing newlines can be added explicitly

  ")
#> 
#> leading or trailing newlines can be added explicitly
```

##### `\\` at the end of a line continues it without a new line.

``` r
glue("
    A formatted string \\
    can also be on a \\
    single line
    ")
#> A formatted string can also be on a single line
```

##### A literal brace is inserted by using doubled braces.

``` r
name <- "Fred"
glue("My name is {name}, not {{name}}.")
#> My name is Fred, not {name}.
```

##### Alternative delimiters can be specified with `.open` and `.close`.

``` r
one <- "1"
glue("The value of $e^{2\\pi i}$ is $<<one>>$.", .open = "<<", .close = ">>")
#> The value of $e^{2\pi i}$ is $1$.
```

##### All valid R code works in expressions, including braces and escaping.

Backslashes do need to be doubled just like in all R strings.

``` r
  `foo}\`` <- "foo"
glue("{
      {
        '}\\'' # { and } in comments, single quotes
        \"}\\\"\" # or double quotes are ignored
        `foo}\\`` # as are { in backticks
      }
  }")
#> foo
```

##### `glue_sql()` makes constructing SQL statements safe and easy

Use backticks to quote identifiers, normal strings and numbers are
quoted appropriately for your backend.

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
