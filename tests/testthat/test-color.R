test_that("glue_col() is just glue() when it should be", {
  skip_if_not_installed("crayon")
  expect_identical(glue_col("foo"), as_glue("foo"))
  expect_identical(glue_col("1 + 1 = {1 + 1}"), glue("1 + 1 = {1 + 1}"))
})

test_that("glue_col() applies crayon functions, crayon not attached", {
  skip_if_not_installed("crayon")
  skip_if("crayon" %in% (.packages()))

  expect_identical(glue_col("{blue foo}"), as_glue(crayon::blue("foo")))
})

test_that("glue_col() applies crayon functions, crayon is attached", {
  skip_if_not_installed("crayon")
  if(!"crayon" %in% (.packages())) {
    withr::local_package("crayon")
  }

  blue_and_white <- bgBlue $ white
  expect_identical(glue_col("{blue_and_white foo}"), as_glue(blue_and_white("foo")))
  expect_identical(glue_col("{blue_and_white {1 + 1}}"), as_glue(blue_and_white("2")))
})

test_that("glue_col() works on multiline strings", {
  skip_if_not_installed("crayon")
  expect_identical(
    glue_col("
    {red foo
        bar
        }"), as_glue(crayon::red("foo\nbar")))
})

test_that("glue_col() works on nested colors", {
  skip_if_not_installed("crayon")
  if(!"crayon" %in% (.packages())) {
    withr::local_package("crayon")
  }
  expect_identical(
    glue_col("{red This is a {green serious} problem}"),
    as_glue(red("This is a " %+% green("serious") %+% " problem"))
  )
})

test_that("glue_col() errors for invalid syntax or when color_fun can't be found", {
  expect_snapshot(error = TRUE, glue_col("{%}"))

  expect_snapshot(error = TRUE, glue_col("{foo %}"))

  foo <- 1
  expect_snapshot(error = TRUE, glue_col("{foo %}"))

  foo <- crayon::blue
  expect_identical(glue_col("{foo %}"), as_glue(foo("%")))
})

test_that("glue_data_col() works", {
  skip_if_not_installed("crayon")
  if(!"crayon" %in% (.packages())) {
    withr::local_package("crayon")
  }
  mt <- head(mtcars)
  expect_identical(
    glue_data_col(mt, "A {blue {gear}} speed car with {bold {hp}} hp!"),
    as_glue("A " %+% blue(mt$gear) %+% " speed car with " %+% bold(mt$hp) %+% " hp!")
  )
})

# https://github.com/tidyverse/glue/issues/158
test_that("glue_col() can exploit the `.literal` argument", {
  skip_if_not_installed("crayon")
  if(!"crayon" %in% (.packages())) {
    withr::local_package("crayon")
  }

  # single quote
  expect_snapshot(
    error = TRUE,
    glue_col("Colorless {green idea's} sleep furiously")
  )
  expect_identical(
    glue_col("Colorless {green idea's} sleep furiously", .literal = TRUE),
    as_glue("Colorless " %+% green("idea's") %+% " sleep furiously")
  )

  # double quote
  expect_snapshot(
    error = TRUE,
    glue_col('Colorless {green idea"s} sleep furiously')
  )
  expect_identical(
    glue_col('Colorless {green idea"s} sleep furiously', .literal = TRUE),
    as_glue("Colorless " %+% green('idea"s') %+% " sleep furiously")
  )

  # backtick
  expect_snapshot(
    error = TRUE,
    glue_col("Colorless {green idea`s} sleep furiously")
  )
  expect_identical(
    glue_col("Colorless {green idea`s} sleep furiously", .literal = TRUE),
    as_glue("Colorless " %+% green("idea`s") %+% " sleep furiously")
  )

  # `#`
  expect_snapshot(
    error = TRUE,
    glue_col("Hey a URL: {blue https://example.com/#section}")
  )
  expect_identical(
    glue_col("Hey a URL: {blue https://example.com/#section}", .literal = TRUE),
    as_glue("Hey a URL: " %+% blue("https://example.com/#section"))
  )
})

test_that("`.literal` does not prevent evaluation", {
  expect_identical(
    glue_col("{blue 1 + 1' = {1 + 1}}", .literal = TRUE),
    as_glue("1 + 1' = 2")
  )
})
