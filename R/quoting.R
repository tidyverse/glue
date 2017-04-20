#' Quoting operators
#'
#' These functions make it easy to quote each individual element and are useful
#' in conjunction with `collapse()`.
#' @param x A character to quote.
#' @name quoting
#' @export
#' @examples
#' x <- 1:5
#' glue('Values of x: {collapse(backtick(x), sep = ", ", last = " and ")}')
single_quote <- function(x) {
  encodeString(x, quote = "'")
}

#' @rdname quoting
#' @export
double_quote <- function(x) {
  encodeString(x, quote = '"')
}

#' @rdname quoting
#' @export
backtick <- function(x) {
  encodeString(x, quote = "`")
}
