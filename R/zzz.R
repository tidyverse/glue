# nocov start
.onLoad <- function(...) {

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
