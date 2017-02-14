
<!-- README.md is generated from README.Rmd. Please edit that file -->
glue
====

[![Travis-CI Build Status](https://travis-ci.org/tidyverse/glue.svg?branch=master)](https://travis-ci.org/tidyverse/glue) [![Coverage Status](https://img.shields.io/codecov/c/github/tidyverse/glue/master.svg)](https://codecov.io/github/tidyverse/glue?branch=master)

Glue strings to data in R. Small, fast, dependency free interpreted string literals.

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("tidyverse/glue")
```

Usage
-----

Long strings can be broken by line and will be concatenated together

``` r
name <- "Fred"
age <- 50
anniversary <- as.Date("1991-10-12")
glue('My name is {name},',
  ' my age next year is {age + 1},',
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#> My name is Fred, my age next year is 51, my anniversary is Saturday, October 12, 1991.
```

You can use named arguments to assign temporary variables

``` r
glue('My name is {name},',
  ' my age next year is {age + 1},',
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
  name = "Joe",
  age = 40,
  anniversary = as.Date("2001-10-12"))
#> My name is Joe, my age next year is 41, my anniversary is Friday, October 12, 2001.
```

`glue_data()` is useful in [magrittr](https://cran.r-project.org/package=magrittr) pipes.

``` r
library(magrittr)
mtcars %>% glue_data("{rownames(.)} has {hp} hp")
#> Mazda RX4 has 110 hp
#> Mazda RX4 Wag has 110 hp
#> Datsun 710 has 93 hp
#> Hornet 4 Drive has 110 hp
#> Hornet Sportabout has 175 hp
#> Valiant has 105 hp
#> Duster 360 has 245 hp
#> Merc 240D has 62 hp
#> Merc 230 has 95 hp
#> Merc 280 has 123 hp
#> Merc 280C has 123 hp
#> Merc 450SE has 180 hp
#> Merc 450SL has 180 hp
#> Merc 450SLC has 180 hp
#> Cadillac Fleetwood has 205 hp
#> Lincoln Continental has 215 hp
#> Chrysler Imperial has 230 hp
#> Fiat 128 has 66 hp
#> Honda Civic has 52 hp
#> Toyota Corolla has 65 hp
#> Toyota Corona has 97 hp
#> Dodge Challenger has 150 hp
#> AMC Javelin has 150 hp
#> Camaro Z28 has 245 hp
#> Pontiac Firebird has 175 hp
#> Fiat X1-9 has 66 hp
#> Porsche 914-2 has 91 hp
#> Lotus Europa has 113 hp
#> Ford Pantera L has 264 hp
#> Ferrari Dino has 175 hp
#> Maserati Bora has 335 hp
#> Volvo 142E has 109 hp
```

Leading whitespace and blank lines are automatically trimmed, which lets you indent the strings naturally.

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

You can use `\\` at the end of a line to prevent adding a newline.

``` r
glue("
    A formatted string \\
    can also be on a \\
    single line
    ")
#> A formatted string can also be on a single line
```

A literal brace can be inserted by using doubled braces.

``` r
name <- "Fred"
glue("My name is {name}, not {{name}}.")
#> My name is Fred, not {name}.
```

All valid R code works in expressions, including braces and escaping. Backslashes do need to be doubled just like in all R strings.

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

Other implementations
=====================

Some other implementations of string interpolation in R (although not using identical syntax).

-   [stringr::str\_interp](http://stringr.tidyverse.org/reference/str_interp.html)
-   [pystr::pystr\_format](https://cran.r-project.org/package=pystr)
-   [R.utils::gstring](https://cran.r-project.org/package=R.utils)
