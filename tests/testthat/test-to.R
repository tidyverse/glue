context("to")

test_that("inputs are concatenated, interpolated variables recycled", {
  expect_identical(c("testastring1", "testastring2"), to("test", "a", "string", "{1:2}"))
})
test_that("to errors if the expression fails", {
  expect_error(to("{NoTfOuNd}"), "object .* not found")
})

test_that("to errors if invalid f-string", {
  expect_error(to("x={x"), "Expecting '}'")
})

test_that("to works with single expressions", {
  foo <- "foo"
  expect_identical(foo, to("{foo}"))

  foo <- 1L
  expect_identical(as.character(foo), to("{foo}"))

  foo <- as.raw(1)
  expect_identical(as.character(foo), to("{foo}"))

  foo <- TRUE
  expect_identical(as.character(foo), to("{foo}"))

  foo <- as.Date("2016-01-01")
  expect_identical(as.character(foo), to("{foo}"))
})

test_that("to works with repeated expressions", {
  foo <- "foo"
  expect_identical(paste(foo, foo), to("{foo} {foo}"))

  foo <- 1L
  expect_identical(paste(as.character(foo), as.character(foo)), to("{foo} {foo}"))

  foo <- as.raw(1)
  expect_identical(paste(as.character(foo), as.character(foo)), to("{foo} {foo}"))

  foo <- TRUE
  expect_identical(paste(as.character(foo), as.character(foo)), to("{foo} {foo}"))

  foo <- as.Date("2016-01-01")
  expect_identical(paste(as.character(foo), as.character(foo)), to("{foo} {foo}"))
})

test_that("to works with multiple expressions", {
  foo <- "foo"
  bar <- "bar"
  expect_identical(paste(foo, bar), to("{foo} {bar}"))

  foo <- 1L
  bar <- 2L
  expect_identical(paste(as.character(foo), as.character(bar)), to("{foo} {bar}"))

  foo <- as.raw(1)
  bar <- as.raw(2)
  expect_identical(paste(as.character(foo), as.character(bar)), to("{foo} {bar}"))

  foo <- TRUE
  bar <- FALSE
  expect_identical(paste(as.character(foo), as.character(bar)), to("{foo} {bar}"))

  foo <- as.Date("2016-01-01")
  bar <- as.Date("2016-01-02")
  expect_identical(paste(as.character(foo), as.character(bar)), to("{foo} {bar}"))
})

test_that("to with doubled braces are converted to single braces", {
  expect_identical("{foo}", to("{{foo}}"))
})

test_that("to works with complex expressions", {
  `foo}\`` <- "foo"

  expect_identical(`foo}\``, to("{
      {
        '}\\'' # { and } in comments, single quotes
        \"}\\\"\" # or double quotes are ignored
        `foo}\\`` # as are { in backticks
      }
  }"))
})

test_that("to works with large outputs", {
  # initial buffer allocates input string length + 1024, 40 * 26 = 1040
  foo <- paste(rep(letters, 40), collapse = "")

  # re-allocation on result
  expect_identical(foo, to("{foo}"))

  # re-allocation on input
  bar <- paste(rep(letters, 40), collapse = "")
  additional <- " some more text that requires an allocation"
  expect_identical(paste0(bar, additional), to("{bar}", additional))
})

test_that("to works with named arguments", {
  name <- "Fred"
  res <- to('My name is {name},',
    ' my age next year is {age + 1}',
    name = "Joe",
    age = 40)

  expect_identical("My name is Joe, my age next year is 41", res)

  expect_identical("Fred", name)
})

test_that("to evaluates arguments in the expected environment", {
  x <- 2
  fun <- function() {
    x <- 1
    to("x: {x}, x+1: {y}", y = x + 1, .envir = parent.frame())
  }

  expect_identical("x: 2, x+1: 3", fun())
})

test_that("error if non length 1 inputs", {
  expect_error(to(1:2, "{1:2}"), "All unnamed arguments must be length 1")
})

test_that("error if not simple recycling", {
  expect_error(to("{1:2}{1:10}"), "Variables must be length 1 or 10")
})

test_that("recycle_columns returns if zero length input", {
  expect_identical(list(), recycle_columns(list()))
})

test_that("collapse works", {
  expect_identical("", collapse(character(0)))

  expect_identical("123", collapse(1:3))
})

test_that("to_data evaluates in the object first, then enclosure, then parent", {
  x <- 1
  y <- 1
  z <- 1
  fun <- function(env = environment()) {
    y <- 2
    to_data(list(x = 3), "{x} {y} {z}", .envir = env)
  }

  # The function environment
  expect_identical("3 2 1", fun())

  # This environment
  env <- environment()
  expect_identical("3 1 1", fun(env))
})

test_that("trim works", {
  expect_identical("test", trim("test"))
  expect_identical("test",
    trim(
      "test"))
  expect_identical("test",
    trim(
      "test
    "))
  expect_identical("test",
    trim("
      test
    "))
  expect_identical("test",
    trim(
      "test"))
  expect_identical("test\n  test2",
    trim("
      test
        test2
    "))
  expect_identical("test\n  test2\n    test3",
    trim("
      test
        test2
          test3
    "))
})
