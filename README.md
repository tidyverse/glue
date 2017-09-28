
<!-- README.md is generated from README.Rmd. Please edit that file -->
glue
====

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/glue)](http://cran.r-project.org/package=glue) [![Travis-CI Build Status](http://travis-ci.org/tidyverse/glue.svg?branch=master)](http://travis-ci.org/tidyverse/glue) [![Coverage Status](http://img.shields.io/codecov/c/github/tidyverse/glue/master.svg)](http://codecov.io/github/tidyverse/glue?branch=master) [![AppVeyor Build Status](http://ci.appveyor.com/api/projects/status/github/tidyverse/glue?branch=master&svg=true)](http://ci.appveyor.com/project/tidyverse/glue)

Glue strings to data in R. Small, fast, dependency free interpreted string literals.

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("tidyverse/glue")
```

Usage
-----

##### Long strings are broken by line and concatenated together.

``` r
name <- "Fred"
age <- 50
anniversary <- as.Date("1991-10-12")
glue('My name is {name},',
  ' my age next year is {age + 1},',
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#> My name is Fred, my age next year is 51, my anniversary is Saturday, October 12, 1991.
```

##### Named arguments are used to assign temporary variables.

``` r
glue('My name is {name},',
  ' my age next year is {age + 1},',
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
  name = "Joe",
  age = 40,
  anniversary = as.Date("2001-10-12"))
#> My name is Joe, my age next year is 41, my anniversary is Friday, October 12, 2001.
```

##### `glue_data()` is useful with [magrittr](http://cran.r-project.org/package=magrittr) pipes.

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

Use backticks to quote identifiers, normal strings and numbers are quoted appropriately for your backend.

``` r
con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
var <- "bar"
tbl <- "basket"
num <- 2
val <- "blue"
glue_sql("
  SELECT {`var`}
  FROM {`tbl`}
  WHERE {`tbl`}.size > {num}
    AND {`tbl`}.color = {val}
  ", .con = con)
#> SELECT `bar`
#> FROM `basket`
#> WHERE `basket`.size > 2
#>   AND `basket`.color = 'blue'

# If you do not want to quote a given value, use `DBI::SQL()` around it, this
# is one way to build up more complex queries with interchangeable sub queries
sub_query <- glue_sql("
  SELECT *
  FROM {`tbl`}
  ", .con = con)

glue_sql("
  SELECT s.{`var`}
  FROM ({DBI::SQL(sub_query)}) AS s
  ", .con = con)
#> SELECT s.`bar`
#> FROM (SELECT *
#> FROM `basket`) AS s

DBI::dbDisconnect(con)
```

Other implementations
=====================

Some other implementations of string interpolation in R (although not using identical syntax).

-   [stringr::str\_interp](http://stringr.tidyverse.org/reference/str_interp.html)
-   [pystr::pystr\_format](http://cran.r-project.org/package=pystr)
-   [R.utils::gstring](http://cran.r-project.org/package=R.utils)
-   [rprintf](http://cran.r-project.org/package=rprintf)
