#' vctrs methods for glue
#' @keywords internal
#' @name glue-vctrs
NULL

# Helpers for preventing inheritance
is_bare_glue <- function(x) {
  identical(class(x), c("glue", "character"))
}
is_bare <- function(x) {
  !is.object(x)
}

#' @rdname glue-vctrs
#' @export
vec_ptype2.glue <- function(x, y, ...) {
  if (is_bare_glue(x)) {
    UseMethod("vec_ptype2.glue", y)
  } else {
    vctrs::vec_default_ptype2(x, y, ...)
  }
}
#' @export
vec_ptype2.glue.character <- function(x, y, ...) {
  if (is_bare(y)) {
    x[0]
  } else {
    vctrs::vec_default_ptype2(x, y, ...)
  }
}
#' @export
vec_ptype2.glue.default <- function(x, y, ...) {
  vctrs::vec_default_ptype2(x, y, ...)
}

# Registered in .onLoad()
vec_ptype2.character.glue <- function(x, y, ...) {
  if (is_bare_glue(y)) {
    y[0]
  } else {
    vctrs::vec_default_ptype2(x, y, ...)
  }
}

#' @rdname glue-vctrs
#' @export
vec_cast.glue <- function(x, to, ...) {
  if (is_bare_glue(to)) {
    UseMethod("vec_cast.glue")
  } else {
    vctrs::vec_default_cast(x, to, ...)
  }
}
#' @export
vec_cast.glue.glue <- function(x, to, ...) {
  if (is_bare_glue(x)) {
    x
  } else {
    vctrs::vec_default_cast(x, to, ...)
  }
}
#' @export
vec_cast.glue.character <- function(x, to, ...) {
  if (is_bare(x)) {
    as_glue(x)
  } else {
    vctrs::vec_default_cast(x, to, ...)
  }
}
#' @export
vec_cast.glue.default <- function(x, to, ...) {
  vctrs::vec_default_cast(x, to, ...)
}

# Registered in .onLoad()
vec_cast.character.glue <- function(x, to, ...) {
  if (is_bare_glue(x)) {
    unclass(x)
  } else {
    vctrs::vec_default_cast(x, to, ...)
  }
}
