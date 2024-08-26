#' Extract all expressions to be evaluated by `glue()`
#'
#' @param ... passed to `glue()`
#' @returns A character vector of expressions to be evaluated
#' @examples
#' extract_glue_expr("foo {character(0)} {bar}")
#' @export
extract_glue_expr <- function(...) {
  ret <- character(0)
  expr_capture <- function(text, envir) {
    ret <<- c(ret, text)
    text
  }
  glue(..., .transformer = expr_capture)
  ret
}
