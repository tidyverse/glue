#' @exportS3Method vctrs::vec_ptype2
vec_ptype2.glue.glue <- function(x, y, ...) {
  x
}
#' @exportS3Method vctrs::vec_ptype2
vec_ptype2.glue.character <- function(x, y, ...) {
  x
}
#' @exportS3Method vctrs::vec_ptype2
vec_ptype2.character.glue <- function(x, y, ...) {
  y
}

# Note order of class is the opposite as for ptype2
#' @exportS3Method vctrs::vec_cast
vec_cast.glue.glue <- function(x, to, ...) {
  x
}
#' @exportS3Method vctrs::vec_cast
vec_cast.glue.character <- function(x, to, ...) {
  as_glue(x)
}
#' @exportS3Method vctrs::vec_cast
vec_cast.character.glue <- function(x, to, ...) {
  unclass(x)
}
