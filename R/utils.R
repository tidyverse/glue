has_names <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep(FALSE, length(x))
  } else {
    !(is.na(nms) | nms == "")
  }
}

# Use an explicit for loop rather than lapply to show evaluation order matters
eval_args <- function(args, envir) {
  res <- vector("list", length(args))
  for (i in seq_along(args)) {
    res[[i]] <- eval(args[[i]], envir = envir)
  }
  names(res) <- names(args)
  res
}

# From tibble::reccycle_columns
recycle_columns <- function (x)
{
    if (length(x) == 0) {
        return(x)
    }
    lengths <- vapply(x, NROW, integer(1))
    max <- max(lengths)
    bad_len <- lengths != 1L & lengths != max
    if (any(bad_len)) {
      stop("Variables must be length 1 or ", max, call. = FALSE)
    }
    short <- lengths == 1
    if (max != 1L && any(short)) {
        x[short] <- lapply(x[short], rep, max)
    }
    x
}
