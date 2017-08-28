context("trim")

test_that("trim works", {
  expect_identical("", trim(""))
  expect_identical(character(), trim(character()))
  expect_identical(" ", trim(" "))
  expect_identical("test", trim("test"))
  expect_identical(" test", trim(" test"))
  expect_identical("test ", trim("test "))
  expect_identical("test", trim("test"))
  expect_identical(c("foo", "bar"), trim(c("foo", "bar")))
  expect_identical(c("foo", "bar"), trim(c("\nfoo", "bar\n")))
  expect_identical("test",
    trim(
      "test"))
  expect_identical("test",
    x <- trim(
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

  expect_identical("\ntest\n",
    trim("

      test

      "))
})

test_that("trim strips escaped newlines", {
  expect_identical(
    "foo bar baz",
    trim("foo bar \\\nbaz"))

  expect_identical(
    trim("
      foo bar \\
      baz"),
      "foo bar baz")

  expect_identical(
    trim("
      foo bar \\
      baz
      "),
      "foo bar baz")

  expect_identical(
    "foo bar baz\n",
    trim("foo bar baz\n\n"))

  expect_identical(
    "\nfoo bar baz",
    trim("\n\nfoo bar baz"))
})

test_that("issue#44", {
  expect_identical(
    trim("12345678
            foo
           bar
          baz
           bar
            baz"),
          "12345678\n  foo\n bar\nbaz\n bar\n  baz")
})

test_that("issue#47", {
  expect_identical(
    trim("
      Hello,
      World.
    "),
    "  Hello,\n  World.")

  expect_identical(
    trim("
      foo
              bar
        123456789"),
      "foo\n        bar\n  123456789")

  expected <- "The stuff before the bullet list\n  * one bullet"

  expect_identical(
    trim("The stuff before the bullet list
            * one bullet
          "), expected)

  expect_identical(
    trim("
      The stuff before the bullet list
        * one bullet"), expected)

  expect_identical(
    trim("
         The stuff before the bullet list
           * one bullet
         "), expected)
})
