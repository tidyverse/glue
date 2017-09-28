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
#' Returning the result with `DBI::SQL()` will suppress quoting if desired.
#' This can be useful for embedding SQL into larger queries.
#' @inheritParams glue
#' @param .con \[`DBIConnection`]:A DBI connection object obtained from `DBI::dbConnect()`.
#' @examples
#' con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
#' var <- "bar"
#' tbl <- "basket"
#' num <- 2
#' val <- "blue"
#' glue_sql("
#'   SELECT {`var`}
#'   FROM {`tbl`}
#'   WHERE {`tbl`}.size > {num}
#'     AND {`tbl`}.color = {val}
#'   ", .con = con)
#'
#' # If you do not want to quote a given value, use `DBI::SQL()` around it, this
#' # is one way to build up more complex queries with interchangeable sub queries
#' sub_query <- glue_sql("
#'   SELECT *
#'   FROM {`tbl`}
#'   ", .con = con)
#'
#' glue_sql("
#'   SELECT s.{`var`}
#'   FROM ({DBI::SQL(sub_query)}) AS s
#'   ", .con = con)
#'
#' DBI::dbDisconnect(con)
#' @export
glue_sql <- function(..., .con, .envir = parent.frame()) {
  glue(..., .envir = .envir, .transformer = sql_quote_transformer(.con))
}

#' @rdname glue_sql
#' @export
glue_data_sql <- function(.x, ..., .con, .envir = parent.frame()) {
  glue_data(.x, ..., .envir = .envir, .transformer = sql_quote_transformer(.con))
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
