# Interpolate strings with SQL escaping

SQL databases often have custom quotation syntax for identifiers and
strings which make writing SQL queries error prone and cumbersome to do.
`glue_sql()` and `glue_data_sql()` are analogs to
[`glue()`](https://glue.tidyverse.org/reference/glue.md) and
[`glue_data()`](https://glue.tidyverse.org/reference/glue.md) which
handle the SQL quoting.
[`glue_sql_collapse()`](https://glue.tidyverse.org/reference/glue_collapse.md)
can be used to collapse
[`DBI::SQL()`](https://dbi.r-dbi.org/reference/SQL.html) objects.

They automatically quote character results, quote identifiers if the
glue expression is surrounded by backticks '`` ` ``' and do not quote
non-characters such as numbers. If numeric data is stored in a character
column (which should be quoted) pass the data to `glue_sql()` as a
character.

Returning the result with
[`DBI::SQL()`](https://dbi.r-dbi.org/reference/SQL.html) will suppress
quoting if desired for a given value.

Note [parameterized
queries](https://solutions.posit.co/connections/db/best-practices/run-queries-safely/#parameterized-queries)
are generally the safest and most efficient way to pass user defined
values in a query, however not every database driver supports them.

If you place a `*` at the end of a glue expression the values will be
collapsed with commas, or if there are no values, produce `NULL`. This
is useful for (e.g.) the [SQL IN
Operator](https://www.w3schools.com/sql/sql_in.asp).

## Usage

``` r
glue_sql(
  ...,
  .con,
  .sep = "",
  .envir = parent.frame(),
  .open = "{",
  .close = "}",
  .na = DBI::SQL("NULL"),
  .null = character(),
  .comment = "#",
  .literal = FALSE,
  .trim = TRUE
)

glue_data_sql(
  .x,
  ...,
  .con,
  .sep = "",
  .envir = parent.frame(),
  .open = "{",
  .close = "}",
  .na = DBI::SQL("NULL"),
  .null = character(),
  .comment = "#",
  .literal = FALSE,
  .trim = TRUE
)
```

## Arguments

- ...:

  \[`expressions`\]  
  Unnamed arguments are taken to be expression string(s) to format.
  Multiple inputs are concatenated together before formatting. Named
  arguments are taken to be temporary variables available for
  substitution.

  For [`glue_data()`](https://glue.tidyverse.org/reference/glue.md),
  elements in `...` override the values in `.x`.

- .con:

  \[`DBIConnection`\]: A DBI connection object obtained from
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html).

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

  \[`character(1)`: `DBI::SQL("NULL")`\]  
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
  [`glue_col()`](https://glue.tidyverse.org/reference/glue_col.md).
  Regard this argument (especially, its name) as experimental.

- .trim:

  \[`logical(1)`: ‘TRUE’\]  
  Whether to trim the input template with
  [`trim()`](https://glue.tidyverse.org/reference/trim.md) or not.

- .x:

  \[`listish`\]  
  An environment, list, or data frame used to lookup values.

## Value

A [`DBI::SQL()`](https://dbi.r-dbi.org/reference/SQL.html) object with
the given query.

## See also

[`glue_sql_collapse()`](https://glue.tidyverse.org/reference/glue_collapse.md)
to collapse [`DBI::SQL()`](https://dbi.r-dbi.org/reference/SQL.html)
objects.

## Examples

``` r
con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
iris2 <- iris
colnames(iris2) <- gsub("[.]", "_", tolower(colnames(iris)))
DBI::dbWriteTable(con, "iris", iris2)
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

# If sepal_length is store on the database as a character explicitly convert
# the data to character to quote appropriately.
glue_sql("
  SELECT {`var`}
  FROM {`tbl`}
  WHERE {`tbl`}.sepal_length > {as.character(num)}
    AND {`tbl`}.species = {val}
  ", .con = con)
#> <SQL> SELECT `sepal_width`
#> FROM `iris`
#> WHERE `iris`.sepal_length > '2'
#>   AND `iris`.species = 'setosa'


# `glue_sql()` can be used in conjuction with parameterized queries using
# `DBI::dbBind()` to provide protection for SQL Injection attacks
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

# `glue_sql()` can be used to build up more complex queries with
# interchangeable sub queries. It returns `DBI::SQL()` objects which are
# properly protected from quoting.
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

# If you want to input multiple values for use in SQL IN statements put `*`
# at the end of the value and the values will be collapsed and quoted appropriately.
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

# If you need to reference variables from multiple tables use `DBI::Id()`.
# Here we create a new table of nicknames, join the two tables together and
# select columns from both tables. Using `DBI::Id()` and the special
# `glue_sql()` syntax ensures all the table and column identifiers are quoted
# appropriately.

iris_db <- "iris"
nicknames_db <- "nicknames"

nicknames <- data.frame(
  species = c("setosa", "versicolor", "virginica"),
  nickname = c("Beachhead Iris", "Harlequin Blueflag", "Virginia Iris"),
  stringsAsFactors = FALSE
)

DBI::dbWriteTable(con, nicknames_db, nicknames)

cols <- list(
  DBI::Id(iris_db, "sepal_length"),
  DBI::Id(iris_db, "sepal_width"),
  DBI::Id(nicknames_db, "nickname")
)

iris_species <- DBI::Id(iris_db, "species")
nicknames_species <- DBI::Id(nicknames_db, "species")

query <- glue_sql("
  SELECT {`cols`*}
  FROM {`iris_db`}
  JOIN {`nicknames_db`}
  ON {`iris_species`}={`nicknames_species`}",
  .con = con
)
query
#> <SQL> SELECT `iris`.`sepal_length`, `iris`.`sepal_width`, `nicknames`.`nickname`
#> FROM `iris`
#> JOIN `nicknames`
#> ON `iris`.`species`=`nicknames`.`species`

DBI::dbGetQuery(con, query, n = 5)
#>   sepal_length sepal_width       nickname
#> 1          5.1         3.5 Beachhead Iris
#> 2          4.9         3.0 Beachhead Iris
#> 3          4.7         3.2 Beachhead Iris
#> 4          4.6         3.1 Beachhead Iris
#> 5          5.0         3.6 Beachhead Iris

DBI::dbDisconnect(con)
```
