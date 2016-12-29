#' Format and interpolate a string
#'
#' Expressions enclosed by braces will be evaluated as R code. Single braces
#' can be inserted by doubling them. The inputs are not vectorized.
#' @param ... String(s) to format, multiple inputs are concatenated together before formatting.
#' @param .sep Separator used to collapse elements if there is more than one result.
#' @param .fun Function to used to format each result.
#' @param .envir Environment to evaluate each expression in. Expressions are
#' evaluated from left to right.
#' @seealso \url{https://www.python.org/dev/peps/pep-0498/} upon which this is based.
#' @examples
#' name <- "Fred"
#' age <- 50
#' anniversary <- as.Date("1991-10-12")
#' f('My name is {name},',
#'   'my age next year is {age + 1},',
#'   'my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#'
#' # single braces can be inserted by doubling them
#' f("My name is {name}, not {{name}}.")
#'
#' # Named arguments can also be supplied and are evaluated first in a
#' # temporary environment.
#' f('My name is {name},',
#'   ' my age next year is {age + 1},',
#'   ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
#'   name = "Joe",
#'   age = 40,
#'   anniversary = as.Date("2001-10-12"))
#' @useDynLib fstrings fstring_
#' @export
fstring <- function(..., .sep = "", .envir = parent.frame(), .fun = as.character) {

  # Perform all evaluations in a temporary environment
  .envir <- new.env(parent = .envir)

  dots <- eval(substitute(alist(...)))
  named <- has_names(dots)

  named_args <- lapply(dots[named], eval, envir = .envir)
  list2env(named_args, envir = .envir)

  unnamed_args <- paste0(lapply(dots[!named], eval, envir = .envir), collapse = "")
  .Call(fstring_, unnamed_args, function(x) paste(collapse = .sep, .fun(eval(parse(text = x), envir = .envir))))
}

#' @export
#' @rdname fstring
f <- fstring
