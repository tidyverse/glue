context("collapse")

test_that("collapse works like paste(collapse=)", {
  expect_identical(paste(collapse = "", character(0)), collapse(character(0)))

  expect_identical(paste(collapse = "", ""), collapse(""))

  expect_identical(paste(collapse = "", 1:10), collapse(1:10))

  expect_identical(paste(collapse = " ", 1:10), collapse(1:10, sep = " "))
})
test_that("collapse truncates", {
  expect_identical("12345678910", collapse(1:10, width = 11))
  expect_identical("12345678910", collapse(1:10, width = 100))
  expect_identical("1234567...", collapse(1:10, width = 10))
  expect_identical("123...", collapse(1:10, width = 6))
  expect_identical("1...", collapse(1:10, width = 4))
  expect_identical("...", collapse(1:10, width = 0))
})

test_that("last argument to collapse", {
  expect_equal(collapse(character(), last = " and "), "")
  expect_equal(collapse("", last = " and "), "")
  expect_equal(collapse(1, last = " and "), "1")
  expect_equal(collapse(1:2, last = " and "), "1 and 2")
  expect_equal(collapse(1:4, ", ", last = " and "), "1, 2, 3 and 4")

  expect_equal(collapse(1:4, ", ", last = " and ", width = 5), "1,...")

  expect_equal(collapse(1:4, ", ", last = " and ", width = 10), "1, 2, 3...")
})
