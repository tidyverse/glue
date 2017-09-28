context("sql")

describe("glue_sql", {
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con))

  it("errors if no connection given", {
    var <- "foo"
    expect_error(glue_sql("{var}"), "missing")
  })
  it("returns the string if no substitions needed", {
    expect_identical(glue_sql("foo", .con = con), as_glue("foo"))
  })
  it("quotes string values", {
    var <- "foo"
    expect_identical(glue_sql("{var}", .con = con), as_glue("'foo'"))
  })
  it("quotes identifiers", {
    var <- "foo"
    expect_identical(glue_sql("{`var`}", .con = con), as_glue("`foo`"))
  })
  it("Does not quote numbers", {
    var <- 1
    expect_identical(glue_sql("{var}", .con = con), as_glue("1"))
  })
  it("Does not quote DBI::SQL()", {
    var <- DBI::SQL("foo")
    expect_identical(glue_sql("{var}", .con = con), as_glue("foo"))
  })
})
