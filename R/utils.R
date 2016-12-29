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

