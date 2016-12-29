context("fstring")

test_that("inputs are concatenated, interpolated variables recycled", {
  expect_identical(c("testastring1", "testastring2"), f("test", "a", "string", "{1:2}"))
})
test_that("fstring errors if the expression fails", {
  expect_error(f("{NoTfOuNd}"), "object .* not found")
})

test_that("fstring errors if invalid f-string", {
  expect_error(f("x={x"), "Expecting '}'")
})

test_that("fstring works with single expressions", {
  foo <- "foo"
  expect_identical(foo, f("{foo}"))

  foo <- 1L
  expect_identical(as.character(foo), f("{foo}"))

  foo <- as.raw(1)
  expect_identical(as.character(foo), f("{foo}"))

  foo <- TRUE
  expect_identical(as.character(foo), f("{foo}"))

  foo <- as.Date("2016-01-01")
  expect_identical(as.character(foo), f("{foo}"))
})

test_that("fstring works with repeated expressions", {
  foo <- "foo"
  expect_identical(paste(foo, foo), f("{foo} {foo}"))

  foo <- 1L
  expect_identical(paste(as.character(foo), as.character(foo)), f("{foo} {foo}"))

  foo <- as.raw(1)
  expect_identical(paste(as.character(foo), as.character(foo)), f("{foo} {foo}"))

  foo <- TRUE
  expect_identical(paste(as.character(foo), as.character(foo)), f("{foo} {foo}"))

  foo <- as.Date("2016-01-01")
  expect_identical(paste(as.character(foo), as.character(foo)), f("{foo} {foo}"))
})

test_that("fstring works with multiple expressions", {
  foo <- "foo"
  bar <- "bar"
  expect_identical(paste(foo, bar), f("{foo} {bar}"))

  foo <- 1L
  bar <- 2L
  expect_identical(paste(as.character(foo), as.character(bar)), f("{foo} {bar}"))

  foo <- as.raw(1)
  bar <- as.raw(2)
  expect_identical(paste(as.character(foo), as.character(bar)), f("{foo} {bar}"))

  foo <- TRUE
  bar <- FALSE
  expect_identical(paste(as.character(foo), as.character(bar)), f("{foo} {bar}"))

  foo <- as.Date("2016-01-01")
  bar <- as.Date("2016-01-02")
  expect_identical(paste(as.character(foo), as.character(bar)), f("{foo} {bar}"))
})

test_that("fstring with doubled braces are converted to single braces", {
  expect_identical("{foo}", f("{{foo}}"))
})

test_that("fstring works with complex expressions", {
  `foo}\`` <- "foo"

  expect_identical(`foo}\``, f("{
      {
        '}\\'' # { and } in comments, single quotes
        \"}\\\"\" # or double quotes are ignored
        `foo}\\`` # as are { in backticks
      }
  }"))
})

test_that("fstring works with large outputs", {
  # initial buffer allocates input string length + 1024, 40 * 26 = 1040
  foo <- paste(rep(letters, 40), collapse = "")

  # re-allocation on result
  expect_identical(foo, f("{foo}"))

  # re-allocation on input
  bar <- paste(rep(letters, 40), collapse = "")
  additional <- " some more text that requires an allocation"
  expect_identical(paste0(bar, additional), f("{bar}", additional))
})

test_that("fstring works with named arguments", {
  name <- "Fred"
  res <- f('My name is {name},',
    ' my age next year is {age + 1}',
    name = "Joe",
    age = 40)

  expect_identical("My name is Joe, my age next year is 41", res)

  expect_identical("Fred", name)
})

test_that("fstring evaluates arguments in the expected environment", {
  x <- 2
  fun <- function() {
    x <- 1
    f("x: {x}, x+1: {y}", y = x + 1, .envir = parent.frame())
  }

  expect_identical("x: 2, x+1: 3", fun())
})

test_that("error if non length 1 inputs", {
  expect_error(f(1:2, "{1:2}"), "All unnamed arguments must be length 1")
})

test_that("error if not simple recycling", {
  expect_error(f("{1:2}{1:10}"), "Variables must be length 1 or 10")
})

test_that("recycle_columns returns if zero length input", {
  expect_identical(list(), recycle_columns(list()))
})
