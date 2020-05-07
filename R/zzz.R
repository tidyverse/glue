# nocov start
.onLoad <- function(...) {
  register_s3_method("testthat", "compare", "glue")

  # Register on package load because vctrs depends on glue and will
  # not be fully loaded when glue is loaded
  on_package_load("vctrs", {
    register_s3_method("vctrs", "vec_ptype2", "glue.glue")
    register_s3_method("vctrs", "vec_ptype2", "character.glue")
    register_s3_method("vctrs", "vec_ptype2", "glue.character")
    register_s3_method("vctrs", "vec_cast", "glue.glue")
    register_s3_method("vctrs", "vec_cast", "character.glue")
    register_s3_method("vctrs", "vec_cast", "glue.character")
  })

  invisible()
}

register_s3_method <- function(pkg, generic, class, fun = NULL) {
  stopifnot(is.character(pkg), length(pkg) == 1)
  stopifnot(is.character(generic), length(generic) == 1)
  stopifnot(is.character(class), length(class) == 1)

  if (is.null(fun)) {
    fun <- get(paste0(generic, ".", class), envir = parent.frame())
  } else {
    stopifnot(is.function(fun))
  }

  if (pkg %in% loadedNamespaces()) {
    registerS3method(generic, class, fun, envir = asNamespace(pkg))
  }

  # Always register hook in case package is later unloaded & reloaded
  setHook(
    packageEvent(pkg, "onLoad"),
    function(...) {
      registerS3method(generic, class, fun, envir = asNamespace(pkg))
    }
  )
}

on_package_load <- function(pkg, expr) {
  if (isNamespaceLoaded(pkg)) {
    expr
  } else {
    thunk <- function(...) expr
    setHook(packageEvent(pkg, "onLoad"), thunk)
  }
}

#nocov end
