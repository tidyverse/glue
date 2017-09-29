#' Interpolate strings with SQL escaping
#'
#' SQL databases often have custom quotation syntax for identifiers and strings
#' which make writing SQL queries error prone and cumbersome to do. `glue_sql()` and
#' `glue_sql_data()` are analogs to `glue()` and `glue_data()` which handle the
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
#' DBI::dbDisconnect(con)
#' @export
glue_sql <- function(..., .con, .envir = parent.frame()) {
  DBI::SQL(glue(..., .envir = .envir, .transformer = sql_quote_transformer(.con)))
}

#' @rdname glue_sql
#' @export
glue_data_sql <- function(.x, ..., .con, .envir = parent.frame()) {
  DBI::SQL(glue_data(.x, ..., .envir = .envir, .transformer = sql_quote_transformer(.con)))
}

sql_quote_transformer <- function(connection) {
  function(code, envir, data) {
    m <- gregexpr("^`|`$", code)
    if (any(m[[1]] != -1)) {
      regmatches(code, m) <- ""
      res <- DBI::dbQuoteIdentifier(conn = connection, as.character(evaluate(code, envir, data)))
    } else {
      res <- evaluate(code, envir, data)
      if (is.character(res)) {
        res <- DBI::dbQuoteString(conn = connection, res)
      }
      res
    }
    res
  }
}
