# nocov start
.onLoad <- function(...) {
  s3_register("testthat::compare", "glue")

  s3_register("waldo::compare_proxy", "glue")

  s3_register("vctrs::vec_ptype2", "glue.glue")
  s3_register("vctrs::vec_ptype2", "character.glue")
  s3_register("vctrs::vec_ptype2", "glue.character")
  s3_register("vctrs::vec_cast", "glue.glue")
  s3_register("vctrs::vec_cast", "character.glue")
  s3_register("vctrs::vec_cast", "glue.character")

  invisible()
}
#nocov end
