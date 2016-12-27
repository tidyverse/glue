context("fstring")

as_fstring <- function(..., .sep = "") {
  structure(paste(..., collapse = .sep), class = c("fstring", "character"))
}

test_that("inputs are concatenated", {
  expect_identical(as_fstring("1:10testastring12"), f(1:10, "test", "a", "string", "{1:2}"))
})
test_that("fstring errors if the expression fails", {
  expect_error(f("{NoTfOuNd}"), "object .* not found")
})

test_that("fstring works with single expressions", {
  foo <- "foo"
  expect_identical(as_fstring(foo), f("{foo}"))

  foo <- 1L
  expect_identical(as_fstring(foo), f("{foo}"))

  foo <- as.raw(1)
  expect_identical(as_fstring(foo), f("{foo}"))

  foo <- TRUE
  expect_identical(as_fstring(foo), f("{foo}"))

  foo <- as.Date("2016-01-01")
  expect_identical(as_fstring(foo), f("{foo}"))
})

test_that("fstring works with repeated expressions", {
  foo <- "foo"
  expect_identical(as_fstring(foo, foo, .sep = " "), f("{foo} {foo}"))

  foo <- 1L
  expect_identical(as_fstring(foo, foo, .sep = " "), f("{foo} {foo}"))

  foo <- as.raw(1)
  expect_identical(as_fstring(foo, foo, .sep = " "), f("{foo} {foo}"))

  foo <- TRUE
  expect_identical(as_fstring(foo, foo, .sep = " "), f("{foo} {foo}"))

  foo <- as.Date("2016-01-01")
  expect_identical(as_fstring(foo, foo, .sep = " "), f("{foo} {foo}"))
})

test_that("fstring works with multiple expressions", {
  foo <- "foo"
  bar <- "bar"
  expect_identical(as_fstring(foo, bar, .sep = " "), f("{foo} {bar}"))

  foo <- 1L
  bar <- 2L
  expect_identical(as_fstring(foo, bar, .sep = " "), f("{foo} {bar}"))

  foo <- as.raw(1)
  bar <- as.raw(2)
  expect_identical(as_fstring(foo, bar, .sep = " "), f("{foo} {bar}"))

  foo <- TRUE
  bar <- FALSE
  expect_identical(as_fstring(foo, bar, .sep = " "), f("{foo} {bar}"))

  foo <- as.Date("2016-01-01")
  bar <- as.Date("2016-01-02")
  expect_identical(as_fstring(foo, bar, .sep = " "), f("{foo} {bar}"))
})

test_that("fstring with doubled braces are converted to single braces", {
  expect_identical(as_fstring("{foo}"), f("{{foo}}"))
})

test_that("fstring works with complex expressions", {
  `foo}\`` <- "foo"

  expect_identical(as_fstring(`foo}\``), f("{
      {
        '}\\'' # { and } in comments, single quotes
        \"}\\\"\" # or double quotes are ignored
        `foo}\\`` # as are { in backticks
      }
  }"))
})
