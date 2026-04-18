# Custom knitr language engines

Glue provides a few [custom language
engines](https://yihui.org/rmarkdown-cookbook/custom-engine.html) for
knitr, which allows you to use glue directly in knitr chunks.

## `glue` engine

The first engine is the `glue` engine, which evaluates the chunk
contents as a glue template.

```` markdown
```{glue}
1 + 1 = {1 + 1}
```
````

    1 + 1 = 2

Here’s one of the best uses of the `glue` engine: Set the knitr option
`results` to the value `'asis'` and output markdown or HTML directly
into the document. Because glue is vectorized, this is a concise way to
generate a dynamic list or other repeated Markdown structure, which is
difficult with inline R code.

```` markdown
```{glue}
#| results: asis
#| echo: false
- **{month.abb}** is short for {month.name}
```
````

- **Jan** is short for January
- **Feb** is short for February
- **Mar** is short for March
- **Apr** is short for April
- **May** is short for May
- **Jun** is short for June
- **Jul** is short for July
- **Aug** is short for August
- **Sep** is short for September
- **Oct** is short for October
- **Nov** is short for November
- **Dec** is short for December

If you want to pass additional arguments into the glue call, simply
include them as chunk options.

```` markdown
```{glue}
#| .open: "<<"
#| .close: ">>"
#| results: asis
#| echo: false
The **median waiting time** between eruptions is <<median(faithful$waiting)>>.
```
````

The **median waiting time** between eruptions is 76.

## `glue_sql` engine

The second engine is `glue_sql`, which will use
[`glue::glue_sql()`](https://glue.tidyverse.org/reference/glue_sql.md)
to generate a SQL query and then run the query using the [sql
engine](https://yihui.org/rmarkdown/language-engines.html).

First we create a new connection to an in-memory SQLite database, and
write a new table to it.

``` r
con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
mtcars$model <- rownames(mtcars)
DBI::dbWriteTable(con, "mtcars", mtcars)
```

Next define some variables we that we can use with glue to interpolate.

``` r
var <- "mpg"
tbl <- "mtcars"
num <- 150
```

Then we can use `glue_sql` to construct and run a query using those
variables into that database. *Note* you need to provide the connection
object as a `connection` chunk option.

In this example there are two type of quotes. The first is a bare
backtick, these are passed directly to the SQL engine unchanged. The
second is backticks inside of braces, which are specially interpreted to
do the proper quoting for the given SQL engine by glue. In this example
we use the `sqlite` engine, which uses backticks for quoting, but you
would use the same backticks inside brace syntax for postgreSQL, and
[`glue_sql()`](https://glue.tidyverse.org/reference/glue_sql.md) would
automatically use double quotes for quoting instead.

```` markdown
```{glue_sql}
#| connection: con
SELECT `model`, `hp`, {`var`}
FROM {`tbl`}
WHERE {`tbl`}.`hp` > {num}
```
````

``` sql
SELECT `model`, `hp`, `mpg`
FROM `mtcars`
WHERE `mtcars`.`hp` > 150
```

| model               |  hp |  mpg |
|:--------------------|----:|-----:|
| Hornet Sportabout   | 175 | 18.7 |
| Duster 360          | 245 | 14.3 |
| Merc 450SE          | 180 | 16.4 |
| Merc 450SL          | 180 | 17.3 |
| Merc 450SLC         | 180 | 15.2 |
| Cadillac Fleetwood  | 205 | 10.4 |
| Lincoln Continental | 215 | 10.4 |
| Chrysler Imperial   | 230 | 14.7 |
| Camaro Z28          | 245 | 13.3 |
| Pontiac Firebird    | 175 | 19.2 |

Displaying records 1 - 10
