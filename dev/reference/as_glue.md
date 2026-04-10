# Coerce object to glue

A glue object is a character vector with S3 class `"glue"`. The `"glue"`
class implements a print method that shows the literal contents (rather
than the string implementation) and a `+` method, so that you can
concatenate with the addition operator.

## Usage

``` r
as_glue(x, ...)
```

## Arguments

- x:

  object to be coerced.

- ...:

  further arguments passed to methods.

## Value

A character vector with S3 class `"glue"`.

## Examples

``` r
x <- as_glue(c("abc", "\"\\\\", "\n"))
x
#> abc
#> "\\
#> 
#> 

x <- 1
y <- 3
glue("x + y") + " = {x + y}"
#> x + y = {x + y}
```
