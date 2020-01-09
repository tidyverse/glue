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

test_that("lines containing only indentation are handled properly", {
  # Tabs and spaces are considered indentation. The following examples look
  # funny because I'm using a tab escape as the last indentation character to
  # prevent RStudio from removing trailing whitespace on save.
  expect_identical(
    trim("
         \ta
         \tb
         \t
         \tc"),
    "a\nb\n\nc"
  )
  expect_identical(
    trim("
         \ta
       \tb
         \t
         \tc"),
    " \ta\nb\n \t\n \tc"
  )
  # A line shorter than min_indent that contains only indentation should not be
  # trimmed, removed, or prepended to the next line.
  expect_identical(
    trim("
       \ta
       \tb
      \t
       \tc"),
    "a\nb\n      \t\nc"
  )
  # Ensure empty intermedite lines are handled properly
  expect_identical(
    trim("
       \ta
       \tb

       \tc"),
    "a\nb\n\nc"
  )
})
