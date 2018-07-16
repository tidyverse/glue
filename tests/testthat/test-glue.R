context("glue")

test_that("inputs are concatenated, interpolated variables recycled", {
  expect_equal(glue("test", "a", "string", "{1:2}"), c("testastring1", "testastring2"))
})
test_that("glue errors if the expression fails", {
  expect_error(glue("{NoTfOuNd}"), "object .* not found")
})

test_that("glue errors if invalid format", {
  expect_error(glue("x={x"), "Expecting '}'")
})

test_that("glue returns length 1 string from length 1 input", {
  expect_equal(glue(""), "")
})

test_that("glue works with single expressions", {
  foo <- "foo"
  expect_equal(glue("{foo}"), foo)

  foo <- 1L
  expect_identical(glue("{foo}"), as_glue(foo))

  foo <- as.raw(1)
  expect_identical(glue("{foo}"), as_glue(foo))

  foo <- TRUE
  expect_identical(glue("{foo}"), as_glue(foo))

  foo <- as.Date("2016-01-01")
  expect_identical(glue("{foo}"), as_glue(foo))
})

test_that("glue works with repeated expressions", {
  foo <- "foo"
  expect_equal(glue("{foo} {foo}"), paste(foo, foo))

  foo <- 1L
  expect_equal(glue("{foo} {foo}"), paste(as.character(foo), as.character(foo)))

  foo <- as.raw(1)
  expect_equal(glue("{foo} {foo}"), paste(as.character(foo), as.character(foo)))

  foo <- TRUE
  expect_equal(glue("{foo} {foo}"), paste(as.character(foo), as.character(foo)))

  foo <- as.Date("2016-01-01")
  expect_equal(glue("{foo} {foo}"), paste(as.character(foo), as.character(foo)))
})

test_that("glue works with multiple expressions", {
  foo <- "foo"
  bar <- "bar"
  expect_equal(glue("{foo} {bar}"), paste(foo, bar))

  foo <- 1L
  bar <- 2L
  expect_equal(glue("{foo} {bar}"), paste(as.character(foo), as.character(bar)))

  foo <- as.raw(1)
  bar <- as.raw(2)
  expect_equal(glue("{foo} {bar}"), paste(as.character(foo), as.character(bar)))

  foo <- TRUE
  bar <- FALSE
  expect_equal(glue("{foo} {bar}"), paste(as.character(foo), as.character(bar)))

  foo <- as.Date("2016-01-01")
  bar <- as.Date("2016-01-02")
  expect_equal(glue("{foo} {bar}"), paste(as.character(foo), as.character(bar)))
})

test_that("glue with doubled braces are converted glue single braces", {
  expect_equal(glue("{{foo}}"), "{foo}")
})

test_that("glue works with complex expressions", {
  `foo}\`` <- "foo"

  expect_equal(glue("{
      {
        '}\\'' # { and } in comments, single quotes
        \"}\\\"\" # or double quotes are ignored
        `foo}\\`` # as are { in backticks
      }
  }"),
  `foo}\``)
})

test_that("glue works with large outputs", {
  # initial buffer allocates input string length + 1024, 40 * 26 = 1040
  foo <- paste(rep(letters, 40), collapse = "")

  # re-allocation on result
  expect_equal(glue("{foo}"), foo)

  # re-allocation on input
  bar <- paste(rep(letters, 40), collapse = "")
  additional <- " some more text that requires an allocation"
  expect_equal(glue("{bar}", additional), paste0(bar, additional))
})

test_that("glue works with named arguments", {
  name <- "Fred"
  res <- glue('My name is {name},',
    ' my age next year is {age + 1},',
    ' a dot is a {.}',
    name = "Joe",
    age = 40,
    . = "'.'")

  expect_equal(
    res,
    "My name is Joe, my age next year is 41, a dot is a '.'"
  )

  expect_identical(name, "Fred")
})

test_that("glue evaluates arguments in the expected environment", {
  x <- 2
  fun <- function() {
    x <- 1
    glue("x: {x}, x+1: {y}", y = x + 1, .envir = parent.frame())
  }

  expect_equal(fun(), "x: 2, x+1: 3")
})

test_that("glue assigns arguments in the environment", {
  expect_equal(glue("{b}", a = 1, b = a), "1")
})

test_that("error if non length 1 inputs", {
  expect_error(glue(1:2, "{1:2}"), "All unnamed arguments must be length 1")
})

test_that("error if not simple recycling", {
  expect_error(glue("{1:2}{1:10}"), "Variables must be length 1 or 10")
})

test_that("recycle_columns returns if zero length input", {
  expect_identical(recycle_columns(list()), list())
  expect_identical(recycle_columns(list(character())), character())
})

test_that("glue_data evaluates in the object first, then enclosure, then parent", {
  x <- 1
  y <- 1
  z <- 1
  fun <- function(env = environment()) {
    y <- 2
    glue_data(list(x = 3), "{x} {y} {z}", .envir = env)
  }

  # The function environment
  expect_equal(fun(), "3 2 1")

  # This environment
  env <- environment()
  expect_equal(fun(env), "3 1 1")

  # A new environment
  env2 <- new.env(parent = emptyenv())
  env2$x <- 3
  env2$y <- 3
  env2$z <- 3

  expect_equal(glue_data(env2, "{x} {y} {z}"), "3 3 3")
})

test_that("glue_data lazily evaluates named interpolation variables, in order", {
  # Decoy 'x', which should not be evaluated
  delayedAssign("x", stop("This 'x' shouldn't have been referenced"))

  env <- new.env()
  env$x <- "blah"

  expect_equal(
    glue_data(.x = env, "{x}{z}", y = stop("!"), z = x),
    "blahblah"
  )
  expect_equal(
    glue_data(.x = env, "{x}{z}", z = x, y = stop("!")),
    "blahblah"
  )
  expect_equal(
    glue_data(.x = list(x = "blah"), "{x}{z}", y = stop("!"), z = x),
    "blahblah"
  )
  expect_equal(
    glue_data(.x = list(x = "blah"), "{x}{z}", z = x, y = stop("!")),
    "blahblah"
  )
  expect_equal(
    glue_data(.x = NULL, "{x}{z}", x = "blah", y = stop("!"), z = x),
    "blahblah"
  )
  expect_equal(
    glue_data(.x = NULL, "blahblah", y = stop("!"), z = x),
    "blahblah"
  )
  expect_equal(
    glue_data(.x = NULL, "blahblah", x = x, y = stop("!"), z = x),
    "blahblah"
  )
})

test_that("converting glue to character", {
  expect_identical(as.character(glue("foo bar")), "foo bar")
})

test_that("converting glue to glue", {
  expect_equal(glue("foo bar"), "foo bar")
})

test_that("printing glue identical to cat()", {
  expect_output(print(glue("foo\nbar")), "foo\nbar")
})

test_that("length 0 inputs produce length 0 outputs", {
  expect_equal(glue("foo", character(0)), character(0))
  expect_equal(glue("foo", NULL), character(0))
  expect_equal(glue("foo", NULL, "bar"), character(0))

  expect_equal(glue("foo", "{character(0)}"), character(0))
  expect_equal(glue("foo {character(0)}"), character(0))
})

test_that("values are trimmed before evaluation", {

  x <- " a1\n b2\n c3"

  expect_equal(
glue("
  A
  {x}
  B
  "),
"A
 a1
 b2
 c3
B")
})

test_that("glue works with alternative delimiters", {
  expect_equal(glue("{1}", .open = "", .close = ""), "{1}")
  expect_equal(glue("{{}}", .open = "", .close = ""), "{{}}")

  expect_equal(glue("<<1>>", .open = "<<", .close = ">>"), "1")
  expect_equal(glue("<<<<>>>>", .open = "<<", .close = ">>"), "<<>>")

  expect_equal(glue("{{1}}", .open = "{{", .close = "}}"), "1")
  expect_equal(glue("{{ {{1}} }}", .open = "{{", .close = "}}"), "1")
  expect_equal(glue("{{ {{{1}}} }}", .open = "{{", .close = "}}"), "1")
  expect_equal(glue("{{ {{{{1}}}} }}", .open = "{{", .close = "}}"), "1")

  expect_equal(glue("[letters[[1]]]", .open = "[", .close = "]"), "a")

  expect_equal(glue("[[ letters[[1]] ]]", .open = "[[", .close = "]]"), "a")
})

test_that("glue always returns UTF-8 encoded strings regardless of input encodings", {
  x <- "fa\xE7ile"
  Encoding(x) <- "latin1"

  x_out <- as_glue(enc2utf8(x))

  expect_identical(glue(x), x_out)
  expect_identical(glue("{x}"), x_out)
  expect_equal(Encoding(glue(x)), "UTF-8")
  expect_equal(Encoding(glue("{x}")), "UTF-8")

  y <- "p\u00E4o"
  Encoding(y) <- "UTF-8"

  y_out <- as_glue(enc2utf8(y))

  expect_identical(glue(y), y_out)
  expect_identical(glue("{y}"), y_out)
  expect_equal(Encoding(glue(y)), "UTF-8")
  expect_equal(Encoding(glue("{y}")), "UTF-8")

  xy_out <- as_glue(paste0(x_out, y_out))

  expect_identical(glue(x, y), xy_out)
  expect_identical(glue("{x}{y}"), xy_out)
  expect_equal(Encoding(glue(x, y)), "UTF-8")
  expect_equal(Encoding(glue("{x}{y}")), "UTF-8")

  expect_equal(Encoding(glue_collapse(x)), "UTF-8")

  skip_on_os(c("mac", "linux", "solaris"))
  withr::with_locale(c(LC_CTYPE = "Chinese (Simplified)_China.936"), {
    z <- "{format(as.Date(\"2018-01-04\"), \"%Y\U5E74\")}"
    z_out <- glue(z)
    expect_equal(Encoding(z_out), "UTF-8")
    expect_equal(z_out, "2018\U5E74")
  })
})

test_that("glue always returns NA_character_ if given any NA input and `.na` == NULL", {
  expect_equal(
    glue("{NA}", .na = NULL),
    NA_character_)

  expect_equal(
    glue(NA, .na = NULL),
    NA_character_)

  expect_equal(
    glue(NA, 1, .na = NULL),
    NA_character_)

  expect_equal(
    glue(1, NA, 2, .na = NULL),
    NA_character_)

  x <- c("foo", NA_character_, "bar")
  expect_equal(
    glue("{x}", .na = NULL),
    c("foo", NA_character_, "bar"))

  expect_equal(
    glue("{1:3} - {x}", .na = NULL),
    c("1 - foo", NA_character_, "3 - bar"))
})

test_that("glue always returns .na if given any NA input and `.na` != NULL", {
  expect_equal(
    glue("{NA}", .na = "foo"),
    "foo")

  expect_equal(
    glue("{NA}", .na = "foo"),
    "foo")

  expect_equal(
    glue(NA, .na = "foo"),
    "foo")

  expect_equal(
    glue(NA, 1, .na = "foo"),
    "foo1")

  expect_equal(
    glue(1, NA, 2, .na = "foo"),
    "1foo2")

  x <- c("foo", NA_character_, "bar")
  expect_equal(
    glue("{x}", .na = "baz"),
    c("foo", "baz", "bar"))

  expect_equal(
    glue("{1:3} - {x}", .na = "baz"),
    c("1 - foo", "2 - baz", "3 - bar"))
})

test_that("glue works within functions", {
  x <- 1
  f <- function(msg) glue(msg, .envir = parent.frame())

  expect_equal(f("{x}"), "1")
})

test_that("scoping works within lapply (#42)", {
  f <- function(msg) {
    glue(msg, .envir = parent.frame())
  }
  expect_identical(lapply(1:2, function(x) f("{x * 2}")),
    list(as_glue("2"), as_glue("4")))
})

test_that("glue works with lots of arguments", {
  expect_equal(
    glue("a", "very", "long", "test", "of", "how", "many", "unnamed",
      "arguments", "you", "can", "have"),
    "averylongtestofhowmanyunnamedargumentsyoucanhave")
})

test_that("glue does not drop it's class when subsetting", {
  expect_equal(glue("foo")[1], "foo")

  expect_equal(glue("foo")[[1]], "foo")

  expect_equal(glue("{1:2}")[2], "2")
})

test_that("interpolation variables can have same names as their values (#89)", {
  x <- 1
  expect_equal(
    glue("{x}", x = x + 1),
    "2")
})

test_that("as_glue works", {
  expect_identical(as_glue(as_glue("x")), as_glue("x"))
})
