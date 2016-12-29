#' Format and interpolate a string
#'
#' Expressions enclosed by braces will be evaluated as R code. Single braces
#' can be inserted by doubling them. The inputs are not vectorized.
#' @param .x An environment, list or data frame.
#' @param ... String(s) to format, multiple inputs are concatenated together before formatting.
#' @param .sep Separator used to separate elements.
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
#' # Named arguments can also be supplied
#' f('My name is {name},',
#'   ' my age next year is {age + 1},',
#'   ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
#'   name = "Joe",
#'   age = 40,
#'   anniversary = as.Date("2001-10-12"))
#'
#' # The f_ variant is useful in magrittr pipes
#' library(magrittr)
#' mtcars %>% f_("{rownames(.)} has {hp} hp")
#' @useDynLib fstrings fstring_impl
#' @name fstring
#' @export
fstring_ <- function(.x, ..., .sep = "", .envir = parent.frame(), .fun = as.character) {

  # Perform all evaluations in a temporary environment
  env <- new.env(parent = .envir)

  # Capture unevaluated arguments
  dots <- eval(substitute(alist(...)))
  named <- has_names(dots)

  # Evaluate named arguments, add results to environment
  named_args <- eval_args(dots[named], envir = env, data = .x)
  list2env(named_args, envir = env)

  # Concatenate unnamed arguments together
  unnamed_args <- eval_args(dots[!named], envir = env, data = .x)

  if (any(lengths(unnamed_args) != 1)) {
    stop("All unnamed arguments must be length 1", call. = FALSE)
  }
  unnamed_args = paste0(unnamed_args, collapse = .sep)

  # Parse any fstrings
  res <- .Call(fstring_impl, unnamed_args, function(expr) .fun(eval2(parse(text = expr), envir = env, data = .x)))

  res <- do.call(paste0, recycle_columns(res))
  trim(res)
}

#' @export
#' @rdname fstring
f_ <- fstring_

#' @export
#' @rdname fstring
fstring <- function(..., .sep = "", .envir = parent.frame(), .fun = as.character) {
  f_(NULL, ..., .sep = .sep, .envir = .envir, .fun = .fun)
}

#' @export
#' @rdname fstring
f <- fstring

#' Collapse a character vector
#'
#' Collapses a character vector of any length into a length 1 vector.
#' @param x The character vector to collapse.
#' @inheritParams base::paste
#' @examples
#' collapse(f("{1:10}"))
#' @export
collapse <- function(x, sep = "") paste(x, collapse = sep)

trim <- function(x) {
  for (i in seq_along(x)) {
    lines <- strsplit(x[[i]], "\n")[[1]]
    if (length(lines) == 1) {
      x[[i]] <- lines
    } else {
      # find the minimum number of leading tabs or spaces after the first line,
      #trim that number from the remaining lines.
      ident <- min(nchar(reg_match(lines[-1], "^[ \t]*")))
      x[[i]] <- paste0(c(lines[[1]], sub(paste0("^[ \t]{", ident, "}"), "", lines[-1])), collapse = "\n")

      # Removing leading blank lines
      x[[i]] <- sub("^[ \t]*\n", '', x[[i]])
      x[[i]] <- sub("\n[ \t]*$", '', x[[i]])
    }
  }
  x
}
