IdentityTransformer <- R6::R6Class("IdentityTransformer",
  public = list(
    input = identity,
    eval = function(expr, env, data) {
      eval2(parse(text = expr), envir = env, data = data)
    },
    output = function(x) {
      enc2utf8(as.character(x))
    }
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

EmojiTransformer <- R6::R6Class("EmojiTransformer",
  inherit = IdentityTransformer,
  private = list(
    collapse = FALSE
  ),
  public = list(
    input = function(x) {
      private$collapse <- grepl("[*]$", x)
      x <- sub("[*]$", "", x)
      x
    },
    eval = function(expr, env, data) {
      if (private$collapse) {
        private$collapse <- FALSE
        return(collapse(emo::ji_find(expr)$emoji))
      }
      emo::ji(expr)
    }
  )
)

SprintfTransformer <- R6::R6Class("SprintfTransformer",
  inherit = IdentityTransformer,
  private = list(
    format = character()
  ),
  public = list(
    input = function(x) {
      m <- regexpr(":.+$", x)
      if (m != -1) {
        private$format <- substring(regmatches(x, m), 2)
        regmatches(x, m) <- ""
      }
      x
    },
    output = function(x) {
      if (nzchar(private$format)) {
        do.call(sprintf, list(glue("%{private$format}f"), x))
      } else {
        as.character(x)
      }
    }
  )
)
