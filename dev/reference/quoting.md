# Quoting operators

These functions make it easy to quote each individual element and are
useful in conjunction with
[`glue_collapse()`](https://glue.tidyverse.org/dev/reference/glue_collapse.md).
These are thin wrappers around
[`base::encodeString()`](https://rdrr.io/r/base/encodeString.html).

## Usage

``` r
single_quote(x)

double_quote(x)

backtick(x)
```

## Arguments

- x:

  A character to quote.

## Value

A character vector of the same length as `x`, with the same attributes
(including names and dimensions) but with no class set.

Marked UTF-8 encodings are preserved.

## Examples

``` r
x <- 1:5
glue('Values of x: {glue_collapse(backtick(x), sep = ", ", last = " and ")}')
#> Values of x: `1`, `2`, `3`, `4` and `5`
```
