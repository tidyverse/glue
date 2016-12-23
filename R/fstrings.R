#' @useDynLib fstrings
#' @importFrom Rcpp sourceCpp
NULL

#' Format a string
#' @param x the string to format
#' @param sep separator used to collapse elements if \code{fun} returns more than one item.
#' @param fun Function to call to format each expression.
#' @param envir Environment to evaluate each expression in. Expressions are
#' evaluated in the order they appear.
#' @examples
#' name <- "Fred"
#' age <- 50
#' anniversary <- as.Date("1991-10-12")
#' f('My name is {name}, my age next year is {age + 1}, my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#' @export
fstring <- function(x, sep = "", fun = as.character, envir = parent.frame()) {
  fstring_(x, function(x) paste(collapse = sep, fun(eval(parse(text = x), envir = envir))))
}

#' @export
#' @rdname fstring
f <- fstring
