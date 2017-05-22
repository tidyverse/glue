#' Format and interpolate a string
#'
#' Expressions enclosed by braces will be evaluated as R code. Single braces
#' can be inserted by doubling them.
#' @param .x \[`listish`]\cr An environment, list or data frame used to lookup values.
#' @param ... \[`expressions`]\cr Expressions string(s) to format, multiple inputs are concatenated together before formatting.
#' @param .sep \[`character(1)`: \sQuote{""}]\cr Separator used to separate elements.
#' @param .envir \[`environment`: `parent.frame()`]\cr Environment to evaluate each expression in. Expressions are
#' evaluated from left to right. If `.x` is an environment, the expressions are
#' evaluated in that environment and `.envir` is ignored.
#' @param .open \[`character(1)`: \sQuote{\\\{}]\cr The opening delimiter. Doubling the
#' full delimiter escapes it.
#' @param .close \[`character(1)`: \sQuote{\\\}}]\cr The closing delimiter. Doubling the
#' full delimiter escapes it.
#' @seealso <https://www.python.org/dev/peps/pep-0498/> and
#' <https://www.python.org/dev/peps/pep-0257> upon which this is based.
#' @examples
#' name <- "Fred"
#' age <- 50
#' anniversary <- as.Date("1991-10-12")
#' glue('My name is {name},',
#'   'my age next year is {age + 1},',
#'   'my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#'
#' # single braces can be inserted by doubling them
#' glue("My name is {name}, not {{name}}.")
#'
#' # Named arguments can also be supplied
#' glue('My name is {name},',
#'   ' my age next year is {age + 1},',
#'   ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
#'   name = "Joe",
#'   age = 40,
#'   anniversary = as.Date("2001-10-12"))
#'
#' # `glue_data()` is useful in magrittr pipes
#' library(magrittr)
#' mtcars %>% glue_data("{rownames(.)} has {hp} hp")
#' @useDynLib glue glue_
#' @name glue
#' @export
glue_data <- function(.x, ..., .sep = "", .envir = parent.frame(), .open = "{", .close = "}") {

  # Perform all evaluations in a temporary environment
  if (is.environment(.x)) {
    env <- new.env(parent = .x)
    .envir <- NULL
  } else {
    env <- new.env(parent = .envir)
  }

  # Capture unevaluated arguments
  dots <- eval(substitute(alist(...)))
  named <- has_names(dots)

  # Evaluate named arguments, add results to environment
  assign_args(dots[named], envir = env, data = .x)

  # Concatenate unnamed arguments together
  unnamed_args <- eval_args(dots[!named], envir = env, data = .x)

  lengths <- lengths(unnamed_args)
  if (any(lengths == 0)) {
    return(character(0))
  }
  if (any(lengths != 1)) {
    stop("All unnamed arguments must be length 1", call. = FALSE)
  }
  unnamed_args <- paste0(unnamed_args, collapse = .sep)
  unnamed_args <- trim(unnamed_args)

  # Parse any glue strings
  res <- .Call(glue_, unnamed_args, function(expr) as.character(eval2(parse(text = expr), envir = env, data = .x)), .open, .close)
  if (any(lengths(res) == 0)) {
    return(character(0))
  }

  res <- do.call(paste0, recycle_columns(res))

  structure(res, class = c("glue", "character"))
}

#' @rdname glue
#' @export
to_data <- glue_data

#' @export
#' @rdname glue
glue <- function(..., .sep = "", .envir = parent.frame()) {
  glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir)
}

#' @rdname glue
#' @export
to <- glue

#' Collapse a character vector
#'
#' Collapses a character vector of any length into a length 1 vector.
#' @param x The character vector to collapse.
#' @param width The maximum string width before truncating with `...`.
#' @param last String used to separate the last two items if `x` has at least
#' 2 items.
#' @inheritParams base::paste
#' @examples
#' collapse(glue("{1:10}"))
#'
#' # Wide values can be truncated
#' collapse(glue("{1:10}"), width = 5)
#'
#' collapse(1:4, ",", last = " and ")
#' #> 1, 2, 3 and 4
#' @export
collapse <- function(x, sep = "", width = Inf, last = "") {
  if (length(x) == 0) {
    return(character())
  }
  if (nzchar(last) && length(x) > 1) {
    res <- collapse(x[seq(1, length(x) - 1)], sep = sep, width = Inf)
    return(collapse(glue(res, last, x[length(x)]), width = width))
  }
  x <- paste0(x, collapse = sep)
  if (width < Inf) {
    x_width <- nchar(x, "width")
    too_wide <- x_width > width
    if (too_wide) {
      x <- paste0(substr(x, 1, width - 3), "...")
    }
  }
  x
}

#' Trim a character vector
#'
#' This trims a character vector according to the trimming rules used by glue.
#' These follow similar rules to [Python Docstrings](https://www.python.org/dev/peps/pep-0257),
#' with the following features.
#'
#' - Leading and trailing whitespace from the first and last lines is removed.
#' - A uniform amount of indentation is stripped from the second line on, equal
#' to the minimum indentation of all non-blank lines after the first.
#' - Lines can be continued across newlines by using `\\`.
#' @param x A character vector to trim.
#' @examples
#' glue("
#'     A formatted string
#'     Can have multiple lines
#'       with additional indention preserved
#'     ")
#'
#' glue("
#'   \\ntrailing or leading newlines can be added explicitly\\n
#'   ")
#'
#' glue("
#'     A formatted string \\
#'     can also be on a \\
#'     single line
#'     ")

#' @useDynLib glue trim_
trim <- function(x) {
  .Call(trim_, x)
}

#' @export
print.glue <- function(x, ..., sep = "\n") {
  cat(x, ..., sep = sep)

  invisible(x)
}

#' Coerce object to glue
#' @param x object to be coerced.
#' @param ... further arguments passed to methods.
#' @export
as_glue <- function(x, ...) {
  UseMethod("as_glue")
}

#' @export
as_glue.default <- function(x, ...) {
  as_glue(as.character(x))
}

#' @export
as_glue.glue <- function(x, ...) {
  x
}

#' @export
as_glue.character <- function(x, ...) {
  structure(x, class = c("glue", "character"))
}

#' @export
as.character.glue <- function(x, ...) {
  unclass(x)
}

#' @importFrom methods setOldClass

setOldClass(c("glue", "character"))
