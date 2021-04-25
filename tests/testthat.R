if (require(testthat)) {
  library(glue)

  test_check("glue")
} else
  warning("'glue' requires 'testthat' for tests")
