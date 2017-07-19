has_names <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep(FALSE, length(x))
  } else {
    !(is.na(nms) | nms == "")
  }
}

# Use an explicit for loop rather than lapply to show evaluation order matters
eval_args <- function(args, envir, data) {
  res <- vector("list", length(args))
  for (i in seq_along(args)) {
    res[[i]] <- eval2(args[[i]], envir = envir, data = data)
  }
  names(res) <- names(args)
  res
}

assign_args <- function(args, envir, data) {
  res <- vector("list", length(args))
  nms <- names(args)
  for (i in seq_along(args)) {
    assign(nms[[i]], eval2(args[[i]], envir = envir, data = data), envir = envir)
  }
}

eval2 <- function(x, envir = parent.frame(), data = NULL) {
  if (is.null(data)) {
    eval(x, envir = envir)
  } else {
    eval(x, envir = data, enclos = envir)
  }
}

# From tibble::recycle_columns
recycle_columns <- function (x)
{
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
  if (requireNamespace("crayon")) {
    crayon::style(x, bg = colour_na())
  } else {
    x # nocov
  }
}
