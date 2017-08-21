#' Evaluate R code
#'
#' This is a simple wrapper around `eval(parse())` which provides a more
#' consistent interface than the default functions.
#' If `data` is `NULL` then the code is evaluated in the environment. If `data`
#' is not `NULL` than the code is evaluated in the `data` object first, with
#' the enclosing environment of `envir`.
#'
#' This function is designed to be used within transformers to evaluate the
#' code in the glue block.
#' @param code R code to evaluate
#' @param envir environment to evaluate the code in
#' @param data listish object to evaluate the code in
#' @export
evaluate <- function(code, envir, data) {
  eval2(parse(text = code), envir = envir, data = data)
}

identity_transformer <- evaluate
