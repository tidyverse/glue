test_that("extract_glue_expr", {
  expect_equal(
    extract_glue_expr("foo {character(0)}"),
    "character(0)"
  )
  expect_equal(
    extract_glue_expr("foo {character(0)} {bar}"),
    c("character(0)", "bar")
  )
  # Maybe someone uses separators with glue specifications in them
  expect_equal(
    extract_glue_expr("foo {character(0)}", "{bar}", .sep = "{baz}"),
    c("character(0)", "baz", "bar")
  )
  expect_equal(
    extract_glue_expr("foo {character(0)}", "{bar}", "{qux}", .sep = "{baz}"),
    c("character(0)", "baz", "bar", "baz", "qux")
  )
})
