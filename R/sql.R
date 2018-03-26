#' Interpolate strings with SQL escaping
#'
#' SQL databases often have custom quotation syntax for identifiers and strings
#' which make writing SQL queries error prone and cumbersome to do. `glue_sql()` and
#' `glue_data_sql()` are analogs to `glue()` and `glue_data()` which handle the
#' SQL quoting.
#'
#' They automatically quote character results, quote identifiers if the glue
#' expression is surrounded by backticks \sQuote{`} and do not quote
#' non-characters such as numbers.
#'
#' Returning the result with `DBI::SQL()` will suppress quoting if desired for
#' a given value.
#'
#' Note [parameterized queries](https://db.rstudio.com/best-practices/run-queries-safely#parameterized-queries)
#' are generally the safest and most efficient way to pass user defined
#' values in a query, however not every database driver supports them.
#'
#' If you place a `*` at the end of a glue expression the values will be
#' collapsed with commas. This is useful for the [SQL IN Operator](https://www.w3schools.com/sql/sql_in.asp)
#' for instance.
#' @inheritParams glue
#' @param .con \[`DBIConnection`]:A DBI connection object obtained from `DBI::dbConnect()`.
#' @return A `DBI::SQL()` object with the given query.
#' @examples
#' con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
#' colnames(iris) <- gsub("[.]", "_", tolower(colnames(iris)))
#' DBI::dbWriteTable(con, "iris", iris)
#' var <- "sepal_width"
#' tbl <- "iris"
#' num <- 2
#' val <- "setosa"
#' glue_sql("
#'   SELECT {`var`}
#'   FROM {`tbl`}
#'   WHERE {`tbl`}.sepal_length > {num}
#'     AND {`tbl`}.species = {val}
#'   ", .con = con)
#'
#' # `glue_sql()` can be used in conjuction with parameterized queries using
#' # `DBI::dbBind()` to provide protection for SQL Injection attacks
#'  sql <- glue_sql("
#'     SELECT {`var`}
#'     FROM {`tbl`}
#'     WHERE {`tbl`}.sepal_length > ?
#'   ", .con = con)
#' query <- DBI::dbSendQuery(con, sql)
#' DBI::dbBind(query, list(num))
#' DBI::dbFetch(query, n = 4)
#' DBI::dbClearResult(query)
#'
#' # `glue_sql()` can be used to build up more complex queries with
#' # interchangeable sub queries. It returns `DBI::SQL()` objects which are
#' # properly protected from quoting.
#' sub_query <- glue_sql("
#'   SELECT *
#'   FROM {`tbl`}
#'   ", .con = con)
#'
#' glue_sql("
#'   SELECT s.{`var`}
#'   FROM ({sub_query}) AS s
#'   ", .con = con)
#'
#' # If you want to input multiple values for use in SQL IN statements put `*`
#' # at the end of the value and the values will be collapsed and quoted appropriately.
#' glue_sql("SELECT * FROM {`tbl`} WHERE sepal_length IN ({vals*})",
#'   vals = 1, .con = con)
#'
#' glue_sql("SELECT * FROM {`tbl`} WHERE sepal_length IN ({vals*})",
#'   vals = 1:5, .con = con)
#'
#' glue_sql("SELECT * FROM {`tbl`} WHERE species IN ({vals*})",
#'   vals = "setosa", .con = con)
#'
#' glue_sql("SELECT * FROM {`tbl`} WHERE species IN ({vals*})",
#'   vals = c("setosa", "versicolor"), .con = con)
#'
#' DBI::dbDisconnect(con)
#' @export
glue_sql <- function(..., .con, .envir = parent.frame(), .na = DBI::SQL("NULL")) {
  DBI::SQL(glue(..., .envir = .envir, .na = .na, .transformer = sql_quote_transformer(.con)))
}

#' @rdname glue_sql
#' @export
glue_data_sql <- function(.x, ..., .con, .envir = parent.frame(), .na = DBI::SQL("NULL")) {
  DBI::SQL(glue_data(.x, ..., .envir = .envir, .na = .na, .transformer = sql_quote_transformer(.con)))
}

sql_quote_transformer <- function(connection) {
  function(code, envir) {
    should_collapse <- grepl("[*]$", code)
    if (should_collapse) {
      code <- sub("[*]$", "", code)
    }
    m <- gregexpr("^`|`$", code)
    is_quoted <- any(m[[1]] != -1)
    if (is_quoted) {
      regmatches(code, m) <- ""
      res <- DBI::dbQuoteIdentifier(conn = connection, evaluate(code, envir))
    } else {
      # Convert all NA's as needed
      res <- evaluate(code, envir)
      if (any(is.na(res))) {
        res <- as.list(res)
        res[is.na(res)] <- NA_character_
      }
      if(is.character(res)) {
        res <- DBI::dbQuoteString(conn = connection, res)
      }
    }
    if (should_collapse) {
      res <- collapse(res, ", ")
    }
    res
  }
}
