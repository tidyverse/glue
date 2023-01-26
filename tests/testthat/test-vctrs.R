
test_that("common type of character and glue is glue", {
  expect_identical(
    vctrs::vec_ptype2(character(), glue()),
    glue()[0]
  )
  expect_identical(
    vctrs::vec_ptype2(glue(), character()),
    glue()[0]
  )
})

test_that("common type is not inherited", {
  expect_error(
    vctrs::vec_ptype2(glue(), structure(character(), class = "foobar")),
    class = "vctrs_error_incompatible_type"
  )
  expect_error(
    vctrs::vec_ptype2(structure(character(), class = "foobar"), glue()),
    class = "vctrs_error_incompatible_type"
  )
  expect_error(
    vctrs::vec_ptype2(character(), structure(glue(), class = "foobar")),
    class = "vctrs_error_incompatible_type"
  )
  expect_error(
    vctrs::vec_ptype2(structure(glue(), class = "foobar"), character()),
    class = "vctrs_error_incompatible_type"
  )
})

test_that("glue and character are coercible", {
  expect_identical(
    vctrs::vec_cast("foo", glue()),
    glue("foo")
  )
  expect_identical(
    vctrs::vec_cast(glue("foo"), character()),
    "foo"
  )
  expect_identical(
    vctrs::vec_cast(glue("foo"), glue()),
    glue("foo")
  )
})

test_that("coercion is not inherited", {
  expect_error(
    vctrs::vec_cast(glue(), structure(character(), class = "foobar")),
    class = "vctrs_error_incompatible_type"
  )
  expect_error(
    vctrs::vec_cast(structure(character(), class = "foobar"), glue()),
    class = "vctrs_error_incompatible_type"
  )
  expect_error(
    vctrs::vec_cast(character(), structure(glue(), class = "foobar")),
    class = "vctrs_error_incompatible_type"
  )
  expect_error(
    vctrs::vec_cast(structure(glue(), class = "foobar"), character()),
    class = "vctrs_error_incompatible_type"
  )
})

test_that("can concatenate glue", {
  expect_identical(
    vctrs::vec_c(glue("foo"), glue("bar")),
    as_glue(c("foo", "bar"))
  )
})
