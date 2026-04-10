# Trim a character vector

This trims a character vector according to the trimming rules used by
glue. These follow similar rules to [Python
Docstrings](https://www.python.org/dev/peps/pep-0257/), with the
following features.

- Leading and trailing whitespace from the first and last lines is
  removed.

- A uniform amount of indentation is stripped from the second line on,
  equal to the minimum indentation of all non-blank lines after the
  first.

- Lines can be continued across newlines by using `\\`.

## Usage

``` r
trim(x)
```

## Arguments

- x:

  A character vector to trim.

## Value

A character vector.

## Examples

``` r
glue("
    A formatted string
    Can have multiple lines
      with additional indentation preserved
    ")
#> A formatted string
#> Can have multiple lines
#>   with additional indentation preserved

glue("
  \ntrailing or leading newlines can be added explicitly\n
  ")
#>   
#> trailing or leading newlines can be added explicitly
#> 

glue("
    A formatted string \\
    can also be on a \\
    single line
    ")
#> A formatted string can also be on a single line
```
