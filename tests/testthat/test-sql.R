skip_if_not_installed("DBI")
skip_if_not_installed("RSQLite")

describe("glue_sql", {
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con))

  it("errors if no connection given", {
    var <- "foo"
    expect_error(glue_sql("{var}"), "missing")
  })
  it("returns the string if no substations needed", {
    expect_identical(glue_sql("foo", .con = con), DBI::SQL("foo"))
  })
  it("quotes string values", {
    var <- "foo"
    expect_identical(glue_sql("{var}", .con = con), DBI::SQL("'foo'"))
  })
  it("quotes identifiers", {
    var <- "foo"
    expect_identical(glue_sql("{`var`}", .con = con), DBI::SQL("`foo`"))
  })
  it("quotes Id identifiers", {
    var <- DBI::Id(schema = "foo", table = "bar", column = "baz")
    expect_identical(glue_sql("{`var`}", .con = con), DBI::SQL("`foo`.`bar`.`baz`"))
  })
  it("quotes lists of Id identifiers", {
    var <- c(
      DBI::Id(schema = "foo", table = "bar", column = "baz"),
      DBI::Id(schema = "foo", table = "bar", column = "baz2")
    )
    expect_identical(glue_sql("{`var`*}", .con = con), DBI::SQL("`foo`.`bar`.`baz`, `foo`.`bar`.`baz2`"))
  })
  it("Does not quote numbers", {
    var <- 1
    expect_identical(glue_sql("{var}", .con = con), DBI::SQL("1"))
  })
  it("Does not quote DBI::SQL()", {
    var <- DBI::SQL("foo")
    expect_identical(glue_sql("{var}", .con = con), DBI::SQL("foo"))
  })
  it("collapses values if succeeded by a *", {
    expect_identical(glue_sql("{var*}", .con = con, var = 1), DBI::SQL(1))
    expect_identical(glue_sql("{var*}", .con = con, var = 1:5), DBI::SQL("1, 2, 3, 4, 5"))

    expect_identical(glue_sql("{var*}", .con = con, var = "a"), DBI::SQL("'a'"))
    expect_identical(glue_sql("{var*}", .con = con, var = letters[1:5]), DBI::SQL("'a', 'b', 'c', 'd', 'e'"))
  })
  it('collapses values should return NULL for length zero vector', {
    expect_identical(glue_sql("{var*}", .con = con, var = character()), DBI::SQL("NULL"))
    expect_identical(glue_sql("{var*}", .con = con, var = DBI::SQL(character())), DBI::SQL("NULL"))
  })
  it("should return an SQL NULL by default for missing values", {
    var <- list(NA, NA_character_, NA_real_, NA_integer_)
    expect_identical(glue_sql("x = {var}", .con = con), rep(DBI::SQL("x = NULL"), 4))
  })

  it("should return NA for missing values and .na = NULL", {
    var <- list(NA, NA_character_, NA_real_, NA_integer_)
    expect_identical(glue_sql("x = {var}", .con = con, .na = NULL), rep(DBI::SQL(NA), 4))
  })

  it("should preserve the type of the even with missing values (#130)", {
      expect_identical(glue_sql("x = {c(1L, NA)}", .con = con), DBI::SQL(c(paste0("x = ", c(1, "NULL")))))
      expect_identical(glue_sql("x = {c(1, NA)}", .con = con), DBI::SQL(c(paste0("x = ", c(1, "NULL")))))
      expect_identical(glue_sql("x = {c('1', NA)}", .con = con), DBI::SQL(c(paste0("x = ", c("'1'", "NULL")))))
      expect_identical(glue_sql("x = {c(TRUE, NA)}", .con = con), DBI::SQL(c(paste0("x = ", c("TRUE", "NULL")))))
  })

  it("should return NA for missing values quote strings", {
    var <- c("C", NA)
    expect_identical(glue_sql("x = {var}", .con = con), DBI::SQL(c("x = 'C'", "x = NULL")))
  })

  it("should return a quoted date for Dates", {
    var <- as.Date("2019-01-01")
    expect_identical(glue_sql("x = {var}", .con = con), DBI::SQL("x = '2019-01-01'"))
  })

  it("should quote values from lists properly", {
    var <- list(1, 2, "three")
    expect_identical(glue_sql("x = {var}", .con = con), DBI::SQL(c("x = 1", "x = 2", "x = 'three'")))
  })

  it("should handle NA when collapsing (#185)", {
    expect_identical(glue_sql("x IN ({c(NA, 'A')*})", .con = con), DBI::SQL(paste0("x IN (NULL, 'A')")))
    expect_identical(glue_sql("x IN ({c(NA, 1)*})", .con = con), DBI::SQL(paste0("x IN (NULL, 1)")))
    expect_identical(glue_sql("x IN ({c(NA, 1L)*})", .con = con), DBI::SQL(paste0("x IN (NULL, 1)")))
    expect_identical(glue_sql("x IN ({c(NA, TRUE)*})", .con = con), DBI::SQL(paste0("x IN (NULL, TRUE)")))
  })

  it("should handle DBI::SQL() elements correctly when collapsing (#191)", {
    expect_identical(glue_sql("x IN ({DBI::SQL(c('a','b'))*})", .con = con), DBI::SQL(paste0("x IN (a, b)")))
  })

  it("should allow whitespace after the *", {
    x <- 1:3
    expect_identical(
      glue_sql(.con = con, "{x* }"),
      DBI::SQL(paste0("1, 2, 3"))
    )
  })
})

describe("glue_data_sql", {
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con))

  it("collapses values if succeeded by a *", {
    var <- "foo"
    expect_identical(glue_data_sql(mtcars, "{head(gear)*}", .con = con), DBI::SQL("4, 4, 4, 3, 3, 3"))
  })
})

describe("glue_sql_collapse", {
  it("returns an SQL object", {
    expect_identical(
      glue_sql_collapse(character()),
      DBI::SQL(character())
    )

    expect_identical(
      glue_sql_collapse(c("foo", "bar", "baz")),
      DBI::SQL("foobarbaz")
    )
  })
})
