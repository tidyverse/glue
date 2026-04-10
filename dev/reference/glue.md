# Format and interpolate a string

Expressions enclosed by braces will be evaluated as R code. Long strings
are broken by line and concatenated together. Leading whitespace and
blank lines from the first and last lines are automatically trimmed.

## Usage

``` r
glue_data(
  .x,
  ...,
  .sep = "",
  .envir = parent.frame(),
  .open = "{",
  .close = "}",
  .na = "NA",
  .null = character(),
  .comment = "#",
  .literal = FALSE,
  .transformer = identity_transformer,
  .trim = TRUE
)

glue(
  ...,
  .sep = "",
  .envir = parent.frame(),
  .open = "{",
  .close = "}",
  .na = "NA",
  .null = character(),
  .comment = "#",
  .literal = FALSE,
  .transformer = identity_transformer,
  .trim = TRUE
)
```

## Arguments

- .x:

  \[`listish`\]  
  An environment, list, or data frame used to lookup values.

- ...:

  \[`expressions`\]  
  Unnamed arguments are taken to be expression string(s) to format.
  Multiple inputs are concatenated together before formatting. Named
  arguments are taken to be temporary variables available for
  substitution.

  For `glue_data()`, elements in `...` override the values in `.x`.

- .sep:

  \[`character(1)`: ‘""’\]  
  Separator used to separate elements.

- .envir:

  \[`environment`:
  [`parent.frame()`](https://rdrr.io/r/base/sys.parent.html)\]  
  Environment to evaluate each expression in. Expressions are evaluated
  from left to right. If `.x` is an environment, the expressions are
  evaluated in that environment and `.envir` is ignored. If `NULL` is
  passed, it is equivalent to
  [`emptyenv()`](https://rdrr.io/r/base/environment.html).

- .open:

  \[`character(1)`: ‘\\’\]  
  The opening delimiter. Doubling the full delimiter escapes it.

- .close:

  \[`character(1)`: ‘\\’\]  
  The closing delimiter. Doubling the full delimiter escapes it.

- .na:

  \[`character(1)`: ‘NA’\]  
  Value to replace `NA` values with. If `NULL` missing values are
  propagated, that is an `NA` result will cause `NA` output. Otherwise
  the value is replaced by the value of `.na`.

- .null:

  \[`character(1)`: ‘character()’\]  
  Value to replace NULL values with. If
  [`character()`](https://rdrr.io/r/base/character.html) whole output is
  [`character()`](https://rdrr.io/r/base/character.html). If `NULL` all
  NULL values are dropped (as in
  [`paste0()`](https://rdrr.io/r/base/paste.html)). Otherwise the value
  is replaced by the value of `.null`.

- .comment:

  \[`character(1)`: ‘#’\]  
  Value to use as the comment character.

- .literal:

  \[`boolean(1)`: ‘FALSE’\]  
  Whether to treat single or double quotes, backticks, and comments as
  regular characters (vs. as syntactic elements), when parsing the
  expression string. Setting `.literal = TRUE` probably only makes sense
  in combination with a custom `.transformer`, as is the case with
  [`glue_col()`](https://glue.tidyverse.org/dev/reference/glue_col.md).
  Regard this argument (especially, its name) as experimental.

- .transformer:

  \[`function`\]  
  A function taking two arguments, `text` and `envir`, where `text` is
  the unparsed string inside the glue block and `envir` is the execution
  environment. A `.transformer` lets you modify a glue block before,
  during, or after evaluation, allowing you to create your own custom
  `glue()`-like functions. See
  [`vignette("transformers")`](https://glue.tidyverse.org/dev/articles/transformers.md)
  for examples.

- .trim:

  \[`logical(1)`: ‘TRUE’\]  
  Whether to trim the input template with
  [`trim()`](https://glue.tidyverse.org/dev/reference/trim.md) or not.

## Value

A glue object, as created by
[`as_glue()`](https://glue.tidyverse.org/dev/reference/as_glue.md).

## See also

<https://www.python.org/dev/peps/pep-0498/> and
<https://www.python.org/dev/peps/pep-0257/> upon which this is based.

## Examples

``` r
name <- "Fred"
age <- 50
anniversary <- as.Date("1991-10-12")
glue('My name is {name},',
  'my age next year is {age + 1},',
  'my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#> My name is Fred,my age next year is 51,my anniversary is Saturday, October 12, 1991.

# single braces can be inserted by doubling them
glue("My name is {name}, not {{name}}.")
#> My name is Fred, not {name}.

# Named arguments can be used to assign temporary variables.
glue('My name is {name},',
  ' my age next year is {age + 1},',
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
  name = "Joe",
  age = 40,
  anniversary = as.Date("2001-10-12"))
#> My name is Joe, my age next year is 41, my anniversary is Friday, October 12, 2001.

# `glue()` can also be used in user defined functions
intro <- function(name, profession, country){
  glue("My name is {name}, a {profession}, from {country}")
}
intro("Shelmith", "Senior Data Analyst", "Kenya")
#> My name is Shelmith, a Senior Data Analyst, from Kenya
intro("Cate", "Data Scientist", "Kenya")
#> My name is Cate, a Data Scientist, from Kenya

# `glue_data()` is useful in magrittr pipes
if (require(magrittr)) {

mtcars %>% glue_data("{rownames(.)} has {hp} hp")

# Or within dplyr pipelines
if (require(dplyr)) {

head(iris) %>%
  mutate(description = glue("This {Species} has a petal length of {Petal.Length}"))

}}
#> Loading required package: magrittr
#> Loading required package: dplyr
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
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

# Alternative delimiters can also be used if needed
one <- "1"
glue("The value of $e^{2\\pi i}$ is $<<one>>$.", .open = "<<", .close = ">>")
#> The value of $e^{2\pi i}$ is $1$.
```
