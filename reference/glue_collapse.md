# Collapse a character vector

`glue_collapse()` collapses a character vector of any length into a
length 1 vector. `glue_sql_collapse()` does the same but returns a
`[DBI::SQL()]` object rather than a glue object.

## Usage

``` r
glue_collapse(x, sep = "", width = Inf, last = "")

glue_sql_collapse(x, sep = "", width = Inf, last = "")
```

## Arguments

- x:

  The character vector to collapse.

- sep:

  a character string to separate the terms. Not
  [`NA_character_`](https://rdrr.io/r/base/NA.html).

- width:

  The maximum string width before truncating with `...`.

- last:

  String used to separate the last two items if `x` has at least 2
  items.

## Value

Always returns a length-1 glue object, as created by
[`as_glue()`](https://glue.tidyverse.org/reference/as_glue.md).

## Examples

``` r
glue_collapse(glue("{1:10}"))
#> 12345678910

# Wide values can be truncated
glue_collapse(glue("{1:10}"), width = 5)
#> 12...

glue_collapse(1:4, ", ", last = " and ")
#> 1, 2, 3 and 4
```
