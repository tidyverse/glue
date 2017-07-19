context("collapse")

test_that("collapse works like paste(collapse=)", {
  # Always return 0 length outputs for 0 length inputs.
  #expect_identical(paste(collapse = "", character(0)), collapse(character(0)))

  expect_identical(as_glue(paste(collapse = "", "")), collapse(""))

  expect_identical(as_glue(paste(collapse = "", 1:10)), collapse(1:10))

  expect_identical(as_glue(paste(collapse = " ", 1:10)), collapse(1:10, sep = " "))
})
test_that("collapse truncates", {
  expect_identical(as_glue("12345678910"), collapse(1:10, width = 11))
  expect_identical(as_glue("12345678910"), collapse(1:10, width = 100))
  expect_identical(as_glue("1234567..."), collapse(1:10, width = 10))
  expect_identical(as_glue("123..."), collapse(1:10, width = 6))
  expect_identical(as_glue("1..."), collapse(1:10, width = 4))
  expect_identical(as_glue("..."), collapse(1:10, width = 0))
})

test_that("last argument to collapse", {
  expect_equal(collapse(character(), last = " and "), as_glue(character()))
  expect_equal(collapse("", last = " and "), as_glue(""))
  expect_equal(collapse(1, last = " and "), as_glue("1"))
  expect_equal(collapse(1:2, last = " and "),as_glue( "1 and 2"))
  expect_equal(collapse(1:4, ", ", last = " and "), as_glue("1, 2, 3 and 4"))

  expect_equal(collapse(1:4, ", ", last = " and ", width = 5), as_glue("1,..."))

  expect_equal(collapse(1:4, ", ", last = " and ", width = 10), as_glue("1, 2, 3..."))
})

test_that("collapse returns 0 length output for 0 length input", {
  expect_identical(collapse(character()), as_glue(character()))
})

test_that("collapse returns NA_character_ if any inputs are NA", {
  expect_identical(collapse(NA_character_), as_glue(NA_character_))

  expect_identical(collapse(c(1, 2, 3, NA_character_)), as_glue(NA_character_))

  expect_identical(collapse(c("foo", NA_character_, "bar")), as_glue(NA_character_))
})
