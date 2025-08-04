# nocov start
.onLoad <- function(...) {
  # Do not swap these for `@exportS3Method`, which has a nasty bug (#TODO)
  s3_register("testthat::compare", "glue")
  s3_register("waldo::compare_proxy", "glue")
  s3_register("vctrs::vec_ptype2", "glue.glue")
  s3_register("vctrs::vec_ptype2", "character.glue")
  s3_register("vctrs::vec_ptype2", "glue.character")
  s3_register("vctrs::vec_cast", "glue.glue")
  s3_register("vctrs::vec_cast", "character.glue")
  s3_register("vctrs::vec_cast", "glue.character")

  if (isNamespaceLoaded("knitr") &&
      "knit_engines" %in% getNamespaceExports("knitr")) {
    knitr::knit_engines$set(glue = eng_glue, glue_sql = eng_glue_sql, gluesql = eng_glue_sql)
  } else {
    setHook(packageEvent("knitr", "onLoad"), function(...) {
      knitr::knit_engines$set(glue = eng_glue, glue_sql = eng_glue_sql, gluesql = eng_glue_sql)
    })
  }

  invisible()
}
#nocov end
