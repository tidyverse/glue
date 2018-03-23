context("color")

skip_if_not_installed("crayon")
library(crayon)

describe("glue_col", {
  it("returns the string if no substations needed", {
    expect_identical(glue_col("foo"), as_glue("foo"))
  })
  it("works the same as glue for parsable expressions", {
    expect_identical(glue_col("1 + 1 = {1 + 1}"), glue("1 + 1 = {1 + 1}"))
  })
  it("applies crayon functions", {
    expect_identical(glue_col("{blue foo}"), as_glue(blue("foo")))

    blue_and_white <- bgBlue $ white
    expect_identical(glue_col("{blue_and_white foo}"), as_glue(blue_and_white("foo")))

    expect_identical(glue_col("{blue_and_white {1 + 1}}"), as_glue(blue_and_white("2")))
  })
  it("works on multiline strings", {
    expect_identical(
      glue_col("
   {red foo
        bar
        }"), as_glue(red("foo\nbar")))
  })
  it("works on nested colors", {
    expect_identical(glue_col("{red This is a {green serious} problem}"),
      as_glue(red("This is a " %+% green("serious") %+% " problem")))
  })

  it("errors if there is invalid syntax or fun is not found", {
    expect_error(glue_col("{_}"), "unexpected input")

    expect_error(glue_col("{foo _}"), "object 'foo' of mode 'function' was not found")

    foo <- 1
    expect_error(glue_col("{foo _}"), "object 'foo' of mode 'function' was not found")

    foo <- crayon::blue
    expect_identical(glue_col("{foo _}"), as_glue(foo("_")))
  })
})

describe("glue_data_col", {
  it("works as expected", {
    mt <- head(mtcars)
    expect_identical(glue_data_col(mt, "A {blue {gear}} speed car with {bold {hp}} hp!"),
      as_glue("A " %+% blue(mt$gear) %+% " speed car with " %+% bold(mt$hp) %+% " hp!"))
  })
})
