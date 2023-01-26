test_that("glue and glue_data safe do not execute code", {
  expect_error(glue_safe("{1+1}"), "object '1\\+1' not found")

  expect_error(glue_data_safe(mtcars, "{1+1}"), "object '1\\+1' not found")

  "1 + 1" <- 5
  expect_equal(glue("{1 + 1}"), "2")
  expect_equal(glue_safe("{1 + 1}"), "5")
})
