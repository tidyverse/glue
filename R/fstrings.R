#' Intrepret string literals
#' @param ... the string(s) to format, multiple inputs are concatonated together before formatting.
#' @param .sep separator used to collapse elements if \code{fun} returns more than one result.
#' @param .fun Function to call to format each expression.
#' @param .envir Environment to evaluate each expression in. Expressions are
#' evaluated in the order they appear.
#' @examples
#' name <- "Fred"
#' age <- 50
#' anniversary <- as.Date("1991-10-12")
#' f('My name is {name},',
#'    'my age next year is {age + 1},',
#'    'my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#'
#' # Can also use alternative f$'text' syntax with `+`
#' f$'My name is {name},' +
#'   'my age next year is {age + 1},' +
#'   'my anniversary is {format(anniversary, "%A, %B %d, %Y")}'
#' @useDynLib fstrings fstring_
#' @export
fstring <- structure(function(..., .sep = "", .fun = as.character, .envir = parent.frame()) {
  res <- .Call(fstring_, paste0(list(...), collapse = ""), function(x) paste(collapse = .sep, .fun(eval(parse(text = x), envir = .envir))))
  structure(res, class = c("fstring", "character"))
}, class = c("fstring", "function"))

#' @export
#' @rdname fstring
f <- fstring

#' @export
`$.fstring` <- function(x, name) {
  fstring(name, .envir = parent.frame())
}

#' @export
`+.fstring` <- function(e1, e2) {
  fstring(e1, e2, .envir = parent.frame())
}

#' @export
`print.fstring` <- function(x, ...) {
  if (inherits(x, "character")) {
    x <- unclass(x)
  }
  NextMethod()
}
