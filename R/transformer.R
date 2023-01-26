#' Parse and Evaluate R code
#'
#' This is a simple wrapper around `eval(parse())`, used as the default
#' transformer.
#' @param text Text (typically) R code to parse and evaluate.
#' @param envir environment to evaluate the code in
#' @seealso `vignette("transformers", "glue")` for documentation on creating
#'   custom glue transformers and some common use cases.
#' @export
identity_transformer <- function(text, envir) {
  if (requireNamespace("rlang", quiet = TRUE)) {
    tryCatch(
      expr <- parse(text = text, keep.source = FALSE),
      error = function(err) {
        rlang::abort(
          "Failed to parse glue component",
          parent = err,
          call = NULL
        )
      }
    )
    tryCatch(
      eval(expr, envir),
      error = function(err) {
        rlang::abort(
          paste0("Failed to evaluate glue component {", text, "}"),
          parent = err,
          call = NULL
        )
      }
    )
  } else {
    eval(parse(text = text, keep.source = FALSE), envir)
  }
}
