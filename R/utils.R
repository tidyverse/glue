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

reg_match <- function(x, regexp, options = NULL) {
  m <- gregexpr(regexp, x, perl = TRUE)
  regmatches(x, m)[[1]]
}
