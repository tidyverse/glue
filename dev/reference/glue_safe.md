# Safely interpolate strings

`glue_safe()` and `glue_data_safe()` differ from
[`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) and
[`glue_data()`](https://glue.tidyverse.org/dev/reference/glue.md) in
that the safe versions only look up symbols from an environment using
[`get()`](https://rdrr.io/r/base/get.html). They do not execute any R
code. This makes them suitable for use with untrusted input, such as
inputs in a Shiny application, where using the normal functions would
allow an attacker to execute arbitrary code.

## Usage

``` r
glue_safe(..., .envir = parent.frame())

glue_data_safe(.x, ..., .envir = parent.frame())
```

## Arguments

- ...:

  \[`expressions`\]  
  Unnamed arguments are taken to be expression string(s) to format.
  Multiple inputs are concatenated together before formatting. Named
  arguments are taken to be temporary variables available for
  substitution.

  For [`glue_data()`](https://glue.tidyverse.org/dev/reference/glue.md),
  elements in `...` override the values in `.x`.

- .envir:

  \[`environment`:
  [`parent.frame()`](https://rdrr.io/r/base/sys.parent.html)\]  
  Environment to evaluate each expression in. Expressions are evaluated
  from left to right. If `.x` is an environment, the expressions are
  evaluated in that environment and `.envir` is ignored. If `NULL` is
  passed, it is equivalent to
  [`emptyenv()`](https://rdrr.io/r/base/environment.html).

- .x:

  \[`listish`\]  
  An environment, list, or data frame used to lookup values.

## Value

A glue object, as created by
[`as_glue()`](https://glue.tidyverse.org/dev/reference/as_glue.md).

## Examples

``` r
"1 + 1" <- 5
# glue actually executes the code
glue("{1 + 1}")
#> 2

# glue_safe just looks up the value
glue_safe("{1 + 1}")
#> 5

rm("1 + 1")
```
