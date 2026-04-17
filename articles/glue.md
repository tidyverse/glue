# Introduction to glue

The glue package contains functions for string interpolation: gluing
together character strings and R code.

``` r
library(glue)
```

## Gluing and interpolating

[`glue()`](https://glue.tidyverse.org/reference/glue.md) can be used to
glue together pieces of text:

``` r
glue("glue ", "some ", "text ", "together")
#> glue some text together
```

But glue’s real power comes with
[`{}`](https://rdrr.io/r/base/Paren.html): anything inside of
[`{}`](https://rdrr.io/r/base/Paren.html) is evaluated and pasted into
the string. This makes it easy to interpolate variables:

``` r
name <- "glue"
glue("We are learning how to use the {name} R package.")
#> We are learning how to use the glue R package.
```

As well as more complex expressions:

``` r
release_date <- as.Date("2017-06-13")
glue("Release was on a {format(release_date, '%A')}.")
#> Release was on a Tuesday.
```

## Control of line breaks

[`glue()`](https://glue.tidyverse.org/reference/glue.md) honors the line
breaks in its input:

``` r
glue("
  A formatted string
  Can have multiple lines
    with additional indentation preserved
  "
)
#> A formatted string
#> Can have multiple lines
#>   with additional indentation preserved
```

The example above demonstrates some other important facts about the
pre-processing of the template string:

- An empty first or last line is automatically trimmed.
- Leading whitespace that is common across all lines is trimmed.

The elimination of common leading whitespace is advantageous, because
you aren’t forced to choose between indenting your code normally and
getting the output you actually want. This is easier to appreciate when
you have [`glue()`](https://glue.tidyverse.org/reference/glue.md) inside
a function body (this example also shows an alternative way of styling
the end of a [`glue()`](https://glue.tidyverse.org/reference/glue.md)
call):

``` r
foo <- function() {
  glue("
    A formatted string
    Can have multiple lines
      with additional indentation preserved")
}
foo()
#> A formatted string
#> Can have multiple lines
#>   with additional indentation preserved
```

On the other hand, what if you don’t want a line break in the output,
but you also like to limit the length of lines in your source code to,
e.g., 80 characters? The first option is to use `\\` to break the
template string into multiple lines, without getting line breaks in the
output:

``` r
release_date <- as.Date("2017-06-13")
glue("
  The first version of the glue package was released on \\
  a {format(release_date, '%A')}.")
#> The first version of the glue package was released on a Tuesday.
```

This comes up fairly often when an expression to evaluate inside
[`{}`](https://rdrr.io/r/base/Paren.html) takes up more characters than
its result, i.e. `format(release_date, '%A')` versus `Tuesday`. A second
way to achieve the same result is to break the template into individual
pieces, which are then concatenated.

``` r
glue(
  "The first version of the glue package was released on ",
  "a {format(release_date, '%A')}."
)
#> The first version of the glue package was released on a Tuesday.
```

If you want an explicit newline at the start or end, include an extra
empty line.

``` r
# no leading or trailing newline
x <- glue("
  blah
  ")
unclass(x)
#> [1] "blah"

# both a leading and trailing newline
y <- glue("

  blah

  ")
unclass(y)
#> [1] "\nblah\n"
```

We use [`unclass()`](https://rdrr.io/r/base/class.html) above to make it
easier to see the absence and presence of the newlines, i.e. to reveal
the literal `\n` escape sequences.
[`glue()`](https://glue.tidyverse.org/reference/glue.md) and friends
generally return a glue object, which is a character vector with the S3
class `"glue"`. The `"glue"` class exists primarily for the sake of a
print method, which displays the natural formatted result of a glue
string. Most of the time this is *exactly* what the user wants to see.
The example above happens to be an exception, where we really do want to
see the underlying string representation.

Here’s another example to drive home the difference between printing a
glue object and looking at its string representation.
[`as.character()`](https://rdrr.io/r/base/character.html) is a another
way to do this that is arguably more expressive.

``` r
x <- glue('
  abc
  " }

  xyz')
class(x)
#> [1] "glue"      "character"

x
#> abc
#> "    }
#> 
#> xyz
unclass(x)
#> [1] "abc\n\"\t}\n\nxyz"
as.character(x)
#> [1] "abc\n\"\t}\n\nxyz"
```

## Delimiters

By default, code to be evaluated goes inside
[`{}`](https://rdrr.io/r/base/Paren.html) in a glue string. If want a
literal curly brace in your string, double it:

``` r
glue("The name of the package is {name}, not {{name}}.")
#> The name of the package is glue, not {name}.
```

Sometimes it’s just more convenient to use different delimiters
altogether, especially if the template text comes from elsewhere or is
subject to external requirements. Consider this example where we want to
interpolate the function name into a code snippet that defines a
function:

``` r
fn_def <- "
  <<NAME>> <- function(x) {
    # imagine a function body here
  }"
glue(fn_def, NAME = "my_function", .open = "<<", .close = ">>")
#> my_function <- function(x) {
#>   # imagine a function body here
#> }
```

In this glue string, `{` and `}` have very special meaning. If we forced
ourselves to double them, suddenly it doesn’t look like normal R code
anymore. Using alternative delimiters is a nice option in cases like
this.

## Where glue looks for values

By default, [`glue()`](https://glue.tidyverse.org/reference/glue.md)
evaluates the code inside [`{}`](https://rdrr.io/r/base/Paren.html) in
the caller environment:

``` r
glue(..., .envir = parent.frame())
```

So, for a top-level
[`glue()`](https://glue.tidyverse.org/reference/glue.md) call, that
means the global environment.

``` r
x <- "the caller environment"
glue("By default, `glue()` evaluates code in {x}.")
#> By default, `glue()` evaluates code in the caller environment.
```

But you can provide more narrowly scoped values by passing them to
[`glue()`](https://glue.tidyverse.org/reference/glue.md) in
`name = value` form:

``` r
x <- "the local environment"
glue(
  "`glue()` can access values from {x} or from {y}. {z}",
  y = "named arguments",
  z = "Woo!"
)
#> `glue()` can access values from the local environment or from named arguments. Woo!
```

If the relevant data lives in a data frame (or list or environment), use
[`glue_data()`](https://glue.tidyverse.org/reference/glue.md) instead:

``` r
mini_mtcars <- head(cbind(model = rownames(mtcars), mtcars))
rownames(mini_mtcars) <- NULL
glue_data(mini_mtcars, "{model} has {hp} hp.")
#> Mazda RX4 has 110 hp.
#> Mazda RX4 Wag has 110 hp.
#> Datsun 710 has 93 hp.
#> Hornet 4 Drive has 110 hp.
#> Hornet Sportabout has 175 hp.
#> Valiant has 105 hp.
```

[`glue_data()`](https://glue.tidyverse.org/reference/glue.md) is very
natural to use with the pipe:

``` r
mini_mtcars |>
  glue_data("{model} gets {mpg} miles per gallon.")
#> Mazda RX4 gets 21 miles per gallon.
#> Mazda RX4 Wag gets 21 miles per gallon.
#> Datsun 710 gets 22.8 miles per gallon.
#> Hornet 4 Drive gets 21.4 miles per gallon.
#> Hornet Sportabout gets 18.7 miles per gallon.
#> Valiant gets 18.1 miles per gallon.
```

Returning to [`glue()`](https://glue.tidyverse.org/reference/glue.md),
recall that it defaults to evaluation in the caller environment. This
has happy implications inside a
[`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
pipeline. The data-masking feature of
[`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html) means
the columns of the target data frame are “in scope” for a
[`glue()`](https://glue.tidyverse.org/reference/glue.md) call:

``` r
library(dplyr)

mini_mtcars |>
  mutate(note = glue("{model} gets {mpg} miles per gallon.")) |>
  select(note, cyl, disp)
#>                                            note cyl disp
#> 1           Mazda RX4 gets 21 miles per gallon.   6  160
#> 2       Mazda RX4 Wag gets 21 miles per gallon.   6  160
#> 3        Datsun 710 gets 22.8 miles per gallon.   4  108
#> 4    Hornet 4 Drive gets 21.4 miles per gallon.   6  258
#> 5 Hornet Sportabout gets 18.7 miles per gallon.   8  360
#> 6           Valiant gets 18.1 miles per gallon.   6  225
```

## SQL

glue has explicit support for constructing SQL statements. Use backticks
to quote identifiers. Normal strings and numbers are quoted
appropriately for your backend.

``` r
con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
colnames(iris) <- gsub("[.]", "_", tolower(colnames(iris)))
DBI::dbWriteTable(con, "iris", iris)
var <- "sepal_width"
tbl <- "iris"
num <- 2
val <- "setosa"
glue_sql("
  SELECT {`var`}
  FROM {`tbl`}
  WHERE {`tbl`}.sepal_length > {num}
    AND {`tbl`}.species = {val}
  ", .con = con)
#> <SQL> SELECT `sepal_width`
#> FROM `iris`
#> WHERE `iris`.sepal_length > 2
#>   AND `iris`.species = 'setosa'
```

[`glue_sql()`](https://glue.tidyverse.org/reference/glue_sql.md) can be
used in conjunction with parameterized queries using
[`DBI::dbBind()`](https://dbi.r-dbi.org/reference/dbBind.html) to
provide protection for SQL Injection attacks.

``` r
sql <- glue_sql("
  SELECT {`var`}
  FROM {`tbl`}
  WHERE {`tbl`}.sepal_length > ?
", .con = con)
query <- DBI::dbSendQuery(con, sql)
DBI::dbBind(query, list(num))
DBI::dbFetch(query, n = 4)
#>   sepal_width
#> 1         3.5
#> 2         3.0
#> 3         3.2
#> 4         3.1
DBI::dbClearResult(query)
```

[`glue_sql()`](https://glue.tidyverse.org/reference/glue_sql.md) can be
used to build up more complex queries with interchangeable sub queries.
It returns [`DBI::SQL()`](https://dbi.r-dbi.org/reference/SQL.html)
objects which are properly protected from quoting.

``` r
sub_query <- glue_sql("
  SELECT *
  FROM {`tbl`}
  ", .con = con)

glue_sql("
  SELECT s.{`var`}
  FROM ({sub_query}) AS s
  ", .con = con)
#> <SQL> SELECT s.`sepal_width`
#> FROM (SELECT *
#> FROM `iris`) AS s
```

If you want to input multiple values for use in SQL IN statements put
`*` at the end of the value and the values will be collapsed and quoted
appropriately.

``` r
glue_sql("SELECT * FROM {`tbl`} WHERE sepal_length IN ({vals*})",
  vals = 1, .con = con)
#> <SQL> SELECT * FROM `iris` WHERE sepal_length IN (1)

glue_sql("SELECT * FROM {`tbl`} WHERE sepal_length IN ({vals*})",
  vals = 1:5, .con = con)
#> <SQL> SELECT * FROM `iris` WHERE sepal_length IN (1, 2, 3, 4, 5)

glue_sql("SELECT * FROM {`tbl`} WHERE species IN ({vals*})",
  vals = "setosa", .con = con)
#> <SQL> SELECT * FROM `iris` WHERE species IN ('setosa')

glue_sql("SELECT * FROM {`tbl`} WHERE species IN ({vals*})",
  vals = c("setosa", "versicolor"), .con = con)
#> <SQL> SELECT * FROM `iris` WHERE species IN ('setosa', 'versicolor')
```
