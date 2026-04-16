test_that("glue engine handles a single-line chunk", {
  skip_if_not_installed("knitr")
  result <- knitr::knit(
    text = c(
      "```{glue}",
      "{1 + 1}",
      "```"
    ),
    quiet = TRUE
  )
  expect_match(result, "2")
})

test_that("glue engine handles a multiline chunk", {
  skip_if_not_installed("knitr")
  result <- knitr::knit(
    text = c(
      "```{glue}",
      "line 1",
      "line 2",
      "```"
    ),
    quiet = TRUE
  )
  expect_match(result, "line 1\nline 2")
})

test_that("glue engine interpolates variables from the knit environment", {
  skip_if_not_installed("knitr")
  result <- knitr::knit(
    text = c(
      "```{r, include=FALSE}",
      "name <- 'world'",
      "```",
      "",
      "```{glue}",
      "Hello {name}!",
      "```"
    ),
    quiet = TRUE
  )
  expect_match(result, "Hello world!")
})

test_that("glue engine passes chunk options through to glue", {
  skip_if_not_installed("knitr")
  result <- knitr::knit(
    text = c(
      "```{glue, .open = '<<', .close = '>>'}",
      "<<1 + 1>>",
      "```"
    ),
    quiet = TRUE
  )
  expect_match(result, "2")
})
