context("quoting")

test_that("single_quote works", {
  expect_identical(single_quote(character()), character())
  expect_identical(single_quote(""), "''")
  expect_identical(single_quote(1:5),
    c("'1'",
      "'2'",
      "'3'",
      "'4'",
      "'5'"
      ))
})

test_that("double_quote works", {
  expect_identical(double_quote(character()), character())
  expect_identical(double_quote(""), '""')
  expect_identical(double_quote(1:5),
    c('"1"',
      '"2"',
      '"3"',
      '"4"',
      '"5"'
      ))
})

test_that("backtick works", {
  expect_identical(backtick(character()), character())
  expect_identical(backtick(""), '``')
  expect_identical(backtick(1:5),
    c("`1`",
      "`2`",
      "`3`",
      "`4`",
      "`5`"
      ))
})
