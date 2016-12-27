context("fstring")

test_that("inputs are concatenated", {
  expect_identical("1:10testastring12", f(1:10, "test", "a", "string", "{1:2}"))
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
