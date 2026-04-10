# Construct strings with color

The [crayon](http://r-lib.github.io/crayon/reference/crayon.md) package
defines a number of functions used to color terminal output.
`glue_col()` and `glue_data_col()` functions provide additional syntax
to make using these functions in glue strings easier.

Using the following syntax will apply the function
[`crayon::blue()`](http://r-lib.github.io/crayon/reference/crayon.md) to
the text 'foo bar'.

    {blue foo bar}

If you want an expression to be evaluated, simply place that in a normal
brace expression (these can be nested).

    {blue 1 + 1 = {1 + 1}}

If the text you want to color contains, e.g., an unpaired quote or a
comment character, specify `.literal = TRUE`.

## Usage

``` r
glue_col(..., .envir = parent.frame(), .na = "NA", .literal = FALSE)

glue_data_col(.x, ..., .envir = parent.frame(), .na = "NA", .literal = FALSE)
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

- .na:

  \[`character(1)`: ‘NA’\]  
  Value to replace `NA` values with. If `NULL` missing values are
  propagated, that is an `NA` result will cause `NA` output. Otherwise
  the value is replaced by the value of `.na`.

- .literal:

  \[`boolean(1)`: ‘FALSE’\]  
  Whether to treat single or double quotes, backticks, and comments as
  regular characters (vs. as syntactic elements), when parsing the
  expression string. Setting `.literal = TRUE` probably only makes sense
  in combination with a custom `.transformer`, as is the case with
  `glue_col()`. Regard this argument (especially, its name) as
  experimental.

- .x:

  \[`listish`\]  
  An environment, list, or data frame used to lookup values.

## Value

A glue object, as created by
[`as_glue()`](https://glue.tidyverse.org/dev/reference/as_glue.md).

## Examples

``` r
library(crayon)

glue_col("{blue foo bar}")
#> foo bar

glue_col("{blue 1 + 1 = {1 + 1}}")
#> 1 + 1 = 2

glue_col("{blue 2 + 2 = {green {2 + 2}}}")
#> 2 + 2 = 4

white_on_black <- bgBlack $ white
glue_col("{white_on_black
  Roses are {red {colors()[[552]]}},
  Violets are {blue {colors()[[26]]}},
  `glue_col()` can show \\
  {red c}{yellow o}{green l}{cyan o}{blue r}{magenta s}
  and {bold bold} and {underline underline} too!
}")
#> Roses are red,
#> Violets are blue,
#> `glue_col()` can show   colors
#> and bold and underline too!

# this would error due to an unterminated quote, if we did not specify
# `.literal = TRUE`
glue_col("{yellow It's} happening!", .literal = TRUE)
#> It's happening!

# `.literal = TRUE` also prevents an error here due to the `#` comment
glue_col(
  "A URL: {magenta https://github.com/tidyverse/glue#readme}",
  .literal = TRUE
)
#> A URL: https://github.com/tidyverse/glue#readme

# `.literal = TRUE` does NOT prevent evaluation
x <- "world"
y <- "day"
glue_col("hello {x}! {green it's a new {y}!}", .literal = TRUE)
#> hello world! it's a new day!
```
