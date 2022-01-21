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

  eng_try <- try(
    knitr::knit_engines$set(glue = eng_glue, glue_sql = eng_glue_sql, gluesql = eng_glue_sql),
    silent = TRUE
  )
  if (inherits(eng_try, "try-error")) {
    setHook(packageEvent("knitr", "onLoad"), function(...) {
      knitr::knit_engines$set(glue = eng_glue, glue_sql = eng_glue_sql, gluesql = eng_glue_sql)
    })
  }

  invisible()
}
#nocov end
