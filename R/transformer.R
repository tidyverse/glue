#' Parse and Evaluate R code
#'
#' This is a simple wrapper around `eval(parse())`, used as the default
#' transformer.
#' @param text Text (typically) R code to parse and evaluate.
#' @param envir environment to evaluate the code in
#' @seealso `vignette("transformers", "glue")` for documentation on creating
#'   custom glue transformers and some common use cases.
#' @export
identity_transformer <- function(text, envir = parent.frame()) {
  with_glue_error(
    expr <- parse(text = text, keep.source = FALSE),
    "Failed to parse glue component"
  )
  with_glue_error(
    eval(expr, envir),
    paste0("Failed to evaluate glue component {", text, "}")
  )
}

with_glue_error <- function(expr, message) {
  if (!requireNamespace("rlang", quietly = TRUE)) {
    return(expr)
  }

  withCallingHandlers(
    expr,
    error = function(cnd) {
      rlang::abort(
        message,
        parent = cnd,
        call = NULL
      )
    }
  )
}
