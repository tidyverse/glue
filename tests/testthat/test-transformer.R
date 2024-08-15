test_that("get nice errors if rlang installed", {
  expect_snapshot(error = TRUE, {
    identity_transformer("x + ")
    identity_transformer("NOTFOUND")
  })
})
