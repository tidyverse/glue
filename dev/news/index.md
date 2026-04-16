# Changelog

## glue (development version)

- The `glue` knitr engine handles multiline chunks now
  ([\#319](https://github.com/tidyverse/glue/issues/319)).

## glue 1.8.0

CRAN release: 2024-09-30

- glue has two new articles:

  - “Get started”, with contributions from
    [@stephhazlitt](https://github.com/stephhazlitt) and
    [@BrennanAntone](https://github.com/BrennanAntone)
    ([\#137](https://github.com/tidyverse/glue/issues/137),
    [\#170](https://github.com/tidyverse/glue/issues/170),
    [\#332](https://github.com/tidyverse/glue/issues/332)).
  - How to write a function that wraps glue
    ([\#281](https://github.com/tidyverse/glue/issues/281)).

- If the last argument of
  [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) is empty,
  it is dropped ([\#320](https://github.com/tidyverse/glue/issues/320)).
  This makes it easy to structure
  [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) calls
  with one argument per line, and to anticipate adding arguments:

  ``` r
  glue(
    "here's some text, ",
    "and maybe more text will be added in the future?",
  )
  ```

- `glue_sql("{var*}")` once again generates `NULL` if var is empty.  
  This reverts [\#292](https://github.com/tidyverse/glue/issues/292).
  ([\#318](https://github.com/tidyverse/glue/issues/318)).

- The `.envir` argument to
  [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) and
  [`glue_data()`](https://glue.tidyverse.org/dev/reference/glue.md)
  really must be an environment now, as documented. Previously a
  list-ish object worked in some cases (by accident, not really by
  design). When you need to lookup values in a list-ish object, use
  `glue_data(.x =)`
  ([\#308](https://github.com/tidyverse/glue/issues/308),
  [\#317](https://github.com/tidyverse/glue/issues/317)). Ditto for
  [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  and
  [`glue_data_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md).

## glue 1.7.0

CRAN release: 2024-01-09

- If rlang is installed, glue will generate more informative errors if
  an interpolated expression either can’t be parsed or fails to evaluate
  ([\#229](https://github.com/tidyverse/glue/issues/229)).

- `+` now works in more situations, and gives errors when one side isn’t
  a character vector. It no longer automatically applies glue
  interpolation to a non-glue input, if there is one. You’ll need to do
  that yourself ([\#286](https://github.com/tidyverse/glue/issues/286)).

- `glue_collapse(character())` (and hence
  `glue_sql_collapse(character())`) now return `""`, so that they always
  return a single string
  ([\#88](https://github.com/tidyverse/glue/issues/88)).

- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now collapses an empty vector to `""` not `"NULL"`
  ([\#272](https://github.com/tidyverse/glue/issues/272)).

- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now uses
  [`DBI::dbQuoteLiteral()`](https://dbi.r-dbi.org/reference/dbQuoteLiteral.html)
  for all object types. This should increase fidelity of escaping for
  different object types
  ([\#279](https://github.com/tidyverse/glue/issues/279)).

- The “Speed of glue” vignette has been converted to an article, which
  allows several package to be removed from `Suggests` (and re-located
  to `Config/Needs/website`). The code got a light refresh, including a
  switch from microbenchmark to bench and more modern use of ggplot2.

- Add `$(C_VISIBILITY)` to compiler flags to hide internal symbols from
  the dll ([\#284](https://github.com/tidyverse/glue/issues/284)
  [@lionel-](https://github.com/lionel-)).

## glue 1.6.2

CRAN release: 2022-02-24

- Modify a test for better forward compatibility with R.

## glue 1.6.1

CRAN release: 2022-01-22

- glue now registers its custom knitr engines in a way that is more
  robust to namespace-loading edge cases that can arise during package
  installation ([\#254](https://github.com/tidyverse/glue/issues/254)).

## glue 1.6.0

CRAN release: 2021-12-17

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md),
  [`glue_data()`](https://glue.tidyverse.org/dev/reference/glue.md),
  [`glue_col()`](https://glue.tidyverse.org/dev/reference/glue_col.md),
  and
  [`glue_data_col()`](https://glue.tidyverse.org/dev/reference/glue_col.md)
  gain a new `.literal` argument, which controls how quotes and the
  comment character are treated when parsing the expression string
  ([\#235](https://github.com/tidyverse/glue/issues/235)). This is
  mostly useful when using a custom transformer.

- Trailing whitespace-only lines don’t interfere with indentation
  ([\#247](https://github.com/tidyverse/glue/issues/247)).

## glue 1.5.1

CRAN release: 2021-11-30

- Jennifer Bryan is now the maintainer.

- The existing custom language engines for knitr, `glue` and `glue_sql`,
  are documented in a new vignette
  ([\#71](https://github.com/tidyverse/glue/issues/71)). *Detail added
  after release: glue now sets up registration of these engines in
  `.onLoad()`.*

- [`glue_col()`](https://glue.tidyverse.org/dev/reference/glue_col.md)
  gives special treatment to styling functions from the crayon package,
  e.g. `glue_col("{blue foo}")` “just works” now, even if crayon is not
  attached (but is installed)
  ([\#241](https://github.com/tidyverse/glue/issues/241)).

- Unterminated backticks trigger the same error as unterminated single
  or double quotes
  ([\#237](https://github.com/tidyverse/glue/issues/237)).

- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  collapses zero-length
  [`DBI::SQL`](https://dbi.r-dbi.org/reference/SQL.html) object into
  `DBI::SQL("NULL")`
  ([\#244](https://github.com/tidyverse/glue/issues/244)
  [@shrektan](https://github.com/shrektan)).

## glue 1.5.0

CRAN release: 2021-11-06

### Breaking changes

- Long deprecated function
  [`collapse()`](https://dplyr.tidyverse.org/reference/compute.html) has
  been removed ([\#213](https://github.com/tidyverse/glue/issues/213))

### New functions and arguments

- New
  [`glue_sql_collapse()`](https://glue.tidyverse.org/dev/reference/glue_collapse.md)
  function to collapse inputs and return a
  [`DBI::SQL()`](https://dbi.r-dbi.org/reference/SQL.html) object
  ([\#103](https://github.com/tidyverse/glue/issues/103)).

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) gains a
  new `.comment` argument, to control the comment character
  ([\#193](https://github.com/tidyverse/glue/issues/193)).

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) gains a
  new `.null` argument, to control the value to replace `NULL` values
  with ([\#217](https://github.com/tidyverse/glue/issues/217),
  [@echasnovski](https://github.com/echasnovski)).

### Bugfixes and minor changes

- `sql_quote_transformer()` is now allows whitespace after the trailing
  `*` ([\#218](https://github.com/tidyverse/glue/issues/218)).
- `compare_proxy.glue()` method defined so glue objects can be compared
  to strings in testthat 3e without errors
  ([\#212](https://github.com/tidyverse/glue/issues/212))
- `print.glue()` no longer prints an empty newline for 0 length inputs
  ([\#214](https://github.com/tidyverse/glue/issues/214))
- Unterminated comments in glue expression now throw an error
  ([\#227](https://github.com/tidyverse/glue/issues/227),
  [@gaborcsardi](https://github.com/gaborcsardi))
- Unterminated quotes in glue expressions now throw an error
  ([\#226](https://github.com/tidyverse/glue/issues/226),
  [@gaborcsardi](https://github.com/gaborcsardi))

## glue 1.4.2

CRAN release: 2020-08-27

- [`glue_safe()`](https://glue.tidyverse.org/dev/reference/glue_safe.md)
  gives a slightly nicer error message
- The required version of R is now 3.2
  ([\#189](https://github.com/tidyverse/glue/issues/189))
- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now collapses [`DBI::SQL()`](https://dbi.r-dbi.org/reference/SQL.html)
  elements correctly
  ([\#192](https://github.com/tidyverse/glue/issues/192)
  [@shrektan](https://github.com/shrektan))
- The internal `compare()` method gains a `...` argument, for
  compatibility with testthat 3.0.0

## glue 1.4.1

CRAN release: 2020-05-13

- Internal changes for compatibility with vctrs 0.3.0
  ([\#187](https://github.com/tidyverse/glue/issues/187)).
- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now replaces missing values correctly when collapsing values
  ([\#185](https://github.com/tidyverse/glue/issues/185)).
- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now always preserves the type of the column even in the presence of
  missing values ([\#130](https://github.com/tidyverse/glue/issues/130))

## glue 1.4.0

CRAN release: 2020-04-03

- `.envir = NULL` is now supported and is equivalent to passing
  `.envir = emptyenv()`
  ([\#140](https://github.com/tidyverse/glue/issues/140))

- New
  [`glue_safe()`](https://glue.tidyverse.org/dev/reference/glue_safe.md)
  and
  [`glue_data_safe()`](https://glue.tidyverse.org/dev/reference/glue_safe.md)
  functions, safer versions of
  [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) that do
  not execute code, only look up values (using
  [`get()`](https://rdrr.io/r/base/get.html)). These alternatives are
  useful for things like shiny applications where you do not have
  control of the input for your glue expressions.
  ([\#140](https://github.com/tidyverse/glue/issues/140))

- Fixed memory access issue and memory leaks found by valgrind.

## glue 1.3.2

CRAN release: 2020-03-12

- glue now implements vctrs methods. This ensures that vectors of glue
  strings are compatible with tidyverse packages like tidyr
  (r-lib/tidyselect#170, tidyverse/tidyr#773,
  [@lionel-](https://github.com/lionel-)).

- Fix a LTO type mismatch warning
  ([\#146](https://github.com/tidyverse/glue/issues/146))

- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now quotes lists of values appropriate to their type, rather than
  coercing all values to characters
  ([\#153](https://github.com/tidyverse/glue/issues/153))

- [`glue_data()`](https://glue.tidyverse.org/dev/reference/glue.md) now
  implicitly coerces `.x` to a list.

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) gains the
  `.trim` argument, like
  [`glue_data()`](https://glue.tidyverse.org/dev/reference/glue.md).

- [`single_quote()`](https://glue.tidyverse.org/dev/reference/quoting.md)
  [`double_quote()`](https://glue.tidyverse.org/dev/reference/quoting.md)
  and
  [`backtick()`](https://glue.tidyverse.org/dev/reference/quoting.md)
  all return `NA` for `NA` inputs
  ([\#135](https://github.com/tidyverse/glue/issues/135)).

- Improve [`trim()`](https://glue.tidyverse.org/dev/reference/trim.md)’s
  handling of lines containing only indentation
  ([\#162](https://github.com/tidyverse/glue/issues/162),
  [\#163](https://github.com/tidyverse/glue/issues/163),
  [@alandipert](https://github.com/alandipert))

## glue 1.3.1

CRAN release: 2019-03-12

### Features

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) now has a
  `+` method to combine strings.
- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now collapses zero-length vector into `DBI::SQL("NULL")`
  ([\#134](https://github.com/tidyverse/glue/issues/134)
  [@shrektan](https://github.com/shrektan)).

### Bugfixes and minor changes

- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now supports unquoting lists of Id objects.
- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now quotes characters with NAs appropriately
  ([\#115](https://github.com/tidyverse/glue/issues/115)).
- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  now quotes Dates appropriately
  ([\#98](https://github.com/tidyverse/glue/issues/98)).
- A potential protection error reported by rchk was fixed.

## glue 1.3.0

CRAN release: 2018-07-17

### Breaking changes

- The `evaluate()` function has been removed. Changes elsewhere in glue
  made the implementation trivial so it was removed for the sake of
  clarity. Previous uses can be replaced by
  `eval(parse(text = text), envir)`.

- [`collapse()`](https://dplyr.tidyverse.org/reference/compute.html) has
  been renamed to
  [`glue_collapse()`](https://glue.tidyverse.org/dev/reference/glue_collapse.md)
  to avoid namespace collisions with
  [`dplyr::collapse()`](https://dplyr.tidyverse.org/reference/compute.html).

### Features

- `compare.glue()` was added, to make it easier to use glue objects in
  [`testthat::expect_equal()`](https://testthat.r-lib.org/reference/equality-expectations.html)
  statements.

- [`glue_col()`](https://glue.tidyverse.org/dev/reference/glue_col.md)
  and
  [`glue_data_col()`](https://glue.tidyverse.org/dev/reference/glue_col.md)
  functions added to display strings with color.

### Bugfixes and minor changes

- Glue now throws an informative error message when it cannot
  interpolate a function into a string
  ([\#114](https://github.com/tidyverse/glue/issues/114),
  [@haleyjeppson](https://github.com/haleyjeppson) &
  [@ijlyttle](https://github.com/ijlyttle)).

- Glue now evaluates unnamed arguments lazily with
  [`delayedAssign()`](https://rdrr.io/r/base/delayedAssign.html), so
  there is no performance cost if an argument is not used.
  ([\#83](https://github.com/tidyverse/glue/issues/83),
  [@egnha](https://github.com/egnha)).

- Fixed a bug where names in the assigned expression of an interpolation
  variable would conflict with the name of the variable itself
  ([\#89](https://github.com/tidyverse/glue/issues/89),
  [@egnha](https://github.com/egnha)).

- Do not drop the `glue` class when subsetting
  ([\#66](https://github.com/tidyverse/glue/issues/66)).

- Fix [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) and
  [`collapse()`](https://dplyr.tidyverse.org/reference/compute.html)
  always return UTF-8 encoded strings
  ([\#81](https://github.com/tidyverse/glue/issues/81),
  [@dpprdan](https://github.com/dpprdan))

## glue 1.2.0

CRAN release: 2017-10-29

- The implementation has been tweaked to be slightly faster in most
  cases.

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) now has a
  `.transformer` argument, which allows you to use custom logic on how
  to evaluate the code within glue blocks. See
  [`vignette("transformers")`](https://glue.tidyverse.org/dev/articles/transformers.md)
  for more details and example transformer functions.

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) now
  returns `NA` if any of the results are `NA` and `.na` is `NULL`.
  Otherwise `NA` values are replaced by the value of `.na`.

- [`trim()`](https://glue.tidyverse.org/dev/reference/trim.md) to use
  the trimming logic from glue is now exported.

- [`glue_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  and
  [`glue_data_sql()`](https://glue.tidyverse.org/dev/reference/glue_sql.md)
  functions added to make constructing SQL statements with glue safer
  and easier.

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) is now
  easier to use when used within helper functions such as `lapply`.

- Fix when last expression in
  [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) is NULL.

## glue 1.1.1

CRAN release: 2017-06-21

- Another fix for PROTECT / REPROTECT found by the rchk static analyzer.

## glue 1.1.0

CRAN release: 2017-06-13

- Fix for PROTECT errors when resizing output strings.

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) always
  returns ‘UTF-8’ strings, converting inputs if in other encodings if
  needed.

- `to()` and `to_data()` have been removed.

- [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) and
  [`glue_data()`](https://glue.tidyverse.org/dev/reference/glue.md) can
  now take alternative delimiters to `{` and `}`. This is useful if you
  are writing to a format that uses a lot of braces, such as LaTeX.
  ([\#23](https://github.com/tidyverse/glue/issues/23))

- [`collapse()`](https://dplyr.tidyverse.org/reference/compute.html) now
  returns 0 length output if given 0 length input
  ([\#28](https://github.com/tidyverse/glue/issues/28)).

## glue 0.0.0.9000

- Fix [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) to
  admit `.` as an embedded expression in a string
  ([\#15](https://github.com/tidyverse/glue/issues/15),
  [@egnha](https://github.com/egnha)).

- Added a `NEWS.md` file to track changes to the package.
