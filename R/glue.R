#' Format and interpolate a string
#'
#' Expressions enclosed by braces will be evaluated as R code. Single braces
#' can be inserted by doubling them. The inputs are not vectorized.
#' @param .x An environment, list or data frame.
#' @param ... String(s) to format, multiple inputs are concatenated together before formatting.
#' @param .sep Separator used to separate elements.
#' @param .envir Environment to evaluate each expression in. Expressions are
#' evaluated from left to right.
#' @seealso \url{https://www.python.org/dev/peps/pep-0498/} upon which this is based.
#' @examples
#' name <- "Fred"
#' age <- 50
#' anniversary <- as.Date("1991-10-12")
#' to('My name is {name},',
#'   'my age next year is {age + 1},',
#'   'my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#'
#' # single braces can be inserted by doubling them
#' to("My name is {name}, not {{name}}.")
#'
#' # Named arguments can also be supplied
#' to('My name is {name},',
#'   ' my age next year is {age + 1},',
#'   ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
#'   name = "Joe",
#'   age = 40,
#'   anniversary = as.Date("2001-10-12"))
#'
#' # `to_data()` is useful in magrittr pipes
#' library(magrittr)
#' mtcars %>% to_data("{rownames(.)} has {hp} hp")
#' @useDynLib glue to_impl
#' @name to
#' @export
to_data <- function(.x, ..., .sep = "", .envir = parent.frame()) {

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

  # Parse any to strings
  res <- .Call(to_impl, unnamed_args, function(expr) as.character(eval2(parse(text = expr), envir = env, data = .x)))

  res <- do.call(paste0, recycle_columns(res))
  trim(res)
}

#' @export
#' @rdname to
to <- function(..., .sep = "", .envir = parent.frame()) {
  to_data(NULL, ..., .sep = .sep, .envir = .envir)
}

#' Collapse a character vector
#'
#' Collapses a character vector of any length into a length 1 vector.
#' @param x The character vector to collapse.
#' @param width The maximum string width before truncating with \sQuote{...}.
#' @param last String used to separate the last two items if \sQuote{x} has at least
#' 2 items.
#' @inheritParams base::paste
#' @examples
#' collapse(to("{1:10}"))
#'
#' # Wide values can be truncated
#' collapse(to("{1:10}"), width = 5)
#'
#' collapse(1:4, ",", last = " and ")
#' #> 1, 2, 3 and 4
#' @export
collapse <- function(x, sep = "", width = Inf, last = "") {
  if (nzchar(last) && length(x) > 1) {
    res <- collapse(x[seq(1, length(x) - 1)], sep = sep, width = Inf)
    return(collapse(to(res, last, x[length(x)]), width = width))
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
