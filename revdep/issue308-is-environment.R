deparse(revdepcheck::cloud_broken(install_failures = TRUE))

revdepcheck::cloud_check(revdep_packages = c(
  "codebook", "diseasystore", "odin", "params",
  "shinyCohortBuilder", "table.glue", "tidytable", "vegawidget"
))

# oops, I failed to include TriDriRegression above
# but it's failing because rstantools is unavailble, so seemingly unrelated

# diseasystore
# was some other, intermittent problem that seems to have disappeared

# shinyCohortBuilder
# not on GitHub, sent an email to maintainer on 2023-12-21

# odin
# data is sometimes a list
# PR made: https://github.com/mrc-ide/odin/pull/310
glue_whisker <- function(template, data) {
  glue::glue(template, .envir = data, .open = "{{", .close = "}}",
             .trim = FALSE)
}

# params
# lst might be a character vector
# PR made: https://github.com/sahilseth/params/pull/15/files
glue::glue(lst[[i]], .envir = lst, .open = "{{{", .close = "}}}")

# codebook
# couldn't dig in due to depedencies being missing from CRAN
# issue opened: https://github.com/rubenarslan/codebook/issues/77

# table.glue
# passes a list as .envir in a few places
# PR made: https://github.com/bcjaeger/table.glue/pull/1

# tidytable
# fix would require greater knowledge of tidytable / data.table than I possess
# issue opened: https://github.com/markfairbanks/tidytable/issues/788

# vegawidget
# fix involves messing with a function that might be used in multiple ways
# issue opened: https://github.com/vegawidget/vegawidget/issues/227
