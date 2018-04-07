has_names <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep(FALSE, length(x))
  } else {
    !(is.na(nms) | nms == "")
  }
}

bind_promises <- function(exprs, parent) {
  env <- env_init <- new.env(parent = baseenv())
  for (i in seq_along(exprs))
    env <- as_promise(.subset(exprs, i), env)
  # Must rechain initial parent environment, rather than creating the
  # promise-making function in 'parent', because 'parent' need not have 'base'
  # as ancestor.
  parent.env(env_init) <- parent
  env
}

as_promise <- function(expr, env) {
  promise <- call("function", as.pairlist(expr), quote(environment()))
  eval(as.call(c(promise, expr)), env)
}

# From tibble::recycle_columns
recycle_columns <- function (x) {
    if (length(x) == 0) {
        return(x)
    }
    lengths <- vapply(x, NROW, integer(1))
    if (any(lengths) == 0) {
      return(character())
    }

    max <- max(lengths)
    bad_len <- lengths != 1L & lengths != max
    if (any(bad_len)) {
      stop(call. = FALSE,
        ngettext(max,
          "Variables must be length 1",
          paste0("Variables must be length 1 or ", max), domain = NA))
    }
    short <- lengths == 1
    if (max != 1L && any(short)) {
        x[short] <- lapply(x[short], rep, max)
    }
    x
}

# From https://github.com/hadley/colformat/blob/0a35999e7d77b9b3a47b4a04662d1c2625f929d3/R/styles.R#L19-L25
colour_na <- function() {
  grDevices::rgb(5, 5, 2, maxColorValue = 5)
}

style_na <- function(x) {
  if (requireNamespace("crayon", quietly = TRUE)) {
    crayon::style(x, bg = colour_na())
  } else {
    x # nocov
  }
}

lengths <- function(x) {
  vapply(x, length, integer(1L))
}

na_rows <- function(res) {
  Reduce(`|`, lapply(res, is.na))
}

"%||%" <- function(x, y) if (is.null(x)) y else x # nocov
