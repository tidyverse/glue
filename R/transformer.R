IdentityTransformer <- R6::R6Class("IdentityTransformer",
  public = list(
    input = identity,
    output = identity
  )
)

SqlQuoteTransformer <- R6::R6Class("SqlQuoteTransformer",
  inherit = IdentityTransformer,
  private = list(
    con = NULL
  ),
  public = list(
    initialize = function(con) {
      private$con <- con
    },
    output = function(x) {
      DBI::dbQuoteString(private$con, x)
    }
  )
)

CollapseTransformer <- R6::R6Class("CollapseTransformer",
  inherit = IdentityTransformer,
  private = list(
    args = list(),
    input_itr = 1,
    output_itr = 1,
    items = integer(),
    regex = character()
  ),
  public = list(
    initialize = function(regex = "[*]$", ...) {
      private$regex <- regex
      private$args <- list(...)
    },
    input = function(x) {
      if (grepl(private$regex, x)) {
        private$items <- c(private$items, private$input_itr)
        x <- sub(private$regex, "", x)
      }
      private$input_itr <- private$input_itr + 1
      x
    },
    output = function(x) {
      if (private$output_itr %in% private$items) {
        x <- do.call(collapse, args = c(list(x), private$args))
      }
      private$output_itr <- private$output_itr + 1
      x
    }
  )
)
