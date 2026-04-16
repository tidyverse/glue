test_that("glue and glue_data safe do not execute code", {
  expect_snapshot(glue_safe("{1+1}"), error = TRUE)

  expect_snapshot(glue_data_safe(mtcars, "{1+1}"), error = TRUE)

  "1 + 1" <- 5
  expect_equal(glue("{1 + 1}"), "2")
  expect_equal(glue_safe("{1 + 1}"), "5")
})
