
<!-- README.md is generated from README.Rmd. Please edit that file -->
fstrings
========

[![Travis-CI Build Status](https://travis-ci.org/jimhester/fstrings.svg?branch=master)](https://travis-ci.org/jimhester/fstrings) [![Coverage Status](https://img.shields.io/codecov/c/github/jimhester/fstrings/master.svg)](https://codecov.io/github/jimhester/fstrings?branch=master)

Python style [f-strings](https://www.python.org/dev/peps/pep-0498/) for R. Small, fast, dependency free interpreted string literals.

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("jimhester/fstrings")
```

Example
-------

Long strings can be broken by line and will be concatenated together. The `f$'text' + 'text2'` form gives a shorter form at a possibly higher cognitive cost.

``` r
name <- "Fred"
age <- 50
anniversary <- as.Date("1991-10-12")
f('My name is {name},',
  ' my age next year is {age + 1},',
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#> [1] "My name is Fred, my age next year is 51, my anniversary is Saturday, October 12, 1991."

# Alternative form
f$'My name is {name},' +
  ' my age next year is {age + 1},' +
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}'
#> [1] "My name is Fred, my age next year is 51, my anniversary is Saturday, October 12, 1991"
```

If you do not want to interpret braces simply double them

``` r
name <- "Fred"
f("My name is {name}, not {{name}}.")
#> [1] "My name is Fred, not {name}."
```

All valid R code works in expressions, including braces and escaping. Backslashes do need to be doubled just like in all R strings.

``` r
  `foo}\`` <- "foo"
f("{
      {
        '}\\'' # { and } in comments, single quotes
        \"}\\\"\" # or double quotes are ignored
        `foo}\\`` # as are { in backticks
      }
  }")
#> [1] "foo"
```

Other implementations
=====================

Some other implementations of string interpolation in R (although not using the f-string syntax).

-   [stringr::str\_interp](http://stringr.tidyverse.org/reference/str_interp.html)
-   [pystr::pystr\_format](https://cran.r-project.org/package=pystr)
-   [R.utils::gstring](https://cran.r-project.org/package=R.utils)
