context("glue_collapse")

test_that("glue_collapse works like paste(glue_collapse=)", {
  # Always return 0 length outputs for 0 length inputs.
  #expect_identical(paste(glue_collapse = "", character(0)), glue_collapse(character(0)))

  expect_identical(as_glue(paste(collapse = "", "")), glue_collapse(""))

  expect_identical(as_glue(paste(collapse = "", 1:10)), glue_collapse(1:10))

  expect_identical(as_glue(paste(collapse = " ", 1:10)), glue_collapse(1:10, sep = " "))
})
test_that("glue_collapse truncates", {
  expect_identical(as_glue("12345678910"), glue_collapse(1:10, width = 11))
  expect_identical(as_glue("12345678910"), glue_collapse(1:10, width = 100))
  expect_identical(as_glue("1234567..."), glue_collapse(1:10, width = 10))
  expect_identical(as_glue("123..."), glue_collapse(1:10, width = 6))
  expect_identical(as_glue("1..."), glue_collapse(1:10, width = 4))
  expect_identical(as_glue("..."), glue_collapse(1:10, width = 0))
})

test_that("last argument to glue_collapse", {
  expect_equal(glue_collapse(character(), last = " and "), as_glue(character()))
  expect_equal(glue_collapse("", last = " and "), as_glue(""))
  expect_equal(glue_collapse(1, last = " and "), as_glue("1"))
  expect_equal(glue_collapse(1:2, last = " and "),as_glue( "1 and 2"))
  expect_equal(glue_collapse(1:4, ", ", last = " and "), as_glue("1, 2, 3 and 4"))

  expect_equal(glue_collapse(1:4, ", ", last = " and ", width = 5), as_glue("1,..."))

  expect_equal(glue_collapse(1:4, ", ", last = " and ", width = 10), as_glue("1, 2, 3..."))
})

test_that("glue_collapse returns 0 length output for 0 length input", {
  expect_identical(glue_collapse(character()), as_glue(character()))
})

test_that("glue_collapse returns NA_character_ if any inputs are NA", {
  expect_identical(glue_collapse(NA_character_), as_glue(NA_character_))

  expect_identical(glue_collapse(c(1, 2, 3, NA_character_)), as_glue(NA_character_))

  expect_identical(glue_collapse(c("foo", NA_character_, "bar")), as_glue(NA_character_))
})
