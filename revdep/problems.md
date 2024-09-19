# adoptr

<details>

* Version: 1.1.0
* GitHub: https://github.com/optad/adoptr
* Source code: https://github.com/cran/adoptr
* Date/Publication: 2024-08-19 07:30:08 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "adoptr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘adoptr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: composite
    > ### Title: Score Composition
    > ### Aliases: composite evaluate,CompositeScore,TwoStageDesign-method
    > 
    > ### ** Examples
    > 
    > ess   <- ExpectedSampleSize(Normal(), PointMassPrior(.4, 1))
    > power <- Power(Normal(), PointMassPrior(.4, 1))
    > 
    > # linear combination:
    > composite({ess - 50*power})
    Error in glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open,  : 
      is.environment(.envir) is not TRUE
    Calls: <Anonymous> ... as_character -> <Anonymous> -> glue_data -> stopifnot
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(adoptr)
      
      Attaching package: 'adoptr'
      
      The following object is masked from 'package:testthat':
      
    ...
       24. │   ├─glue:::with_glue_error(...)
       25. │   │ └─base::withCallingHandlers(...)
       26. │   └─base::eval(expr, envir)
       27. │     └─base::eval(expr, envir)
       28. └─glue (local) `<fn>`(`<smplErrr>`)
       29.   └─rlang::abort(message, parent = cnd, call = NULL)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 386 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘adoptr.Rmd’ using rmarkdown
    ```

# atrrr

<details>

* Version: 0.0.3
* GitHub: https://github.com/JBGruber/atrrr
* Source code: https://github.com/cran/atrrr
* Date/Publication: 2024-03-05 15:40:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "atrrr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
       13. │           └─glue::glue_data(...)
       14. │             └─base::stopifnot(is.environment(.envir))
       15. │               └─base::stop(simpleError(msg, call = if (p <- sys.parent(1L)) sys.call(p)))
       16. └─purrr (local) `<fn>`(`<smplErrr>`)
       17.   └─cli::cli_abort(...)
       18.     └─rlang::abort(...)
      
      [ FAIL 6 | WARN 0 | SKIP 2 | PASS 146 ]
      Error: Test failures
      Execution halted
    ```

# codebook

<details>

* Version: 0.9.2
* GitHub: https://github.com/rubenarslan/codebook
* Source code: https://github.com/cran/codebook
* Date/Publication: 2020-06-06 23:40:03 UTC
* Number of recursive dependencies: 155

Run `revdepcheck::cloud_details(, "codebook")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘codebook.Rmd’ using rmarkdown
    Failed with error:  'there is no package called 'GGally''
    Failed with error:  'there is no package called 'GGally''
    
    Quitting from lines 85-86 [cb] (codebook.Rmd)
    Error: processing vignette 'codebook.Rmd' failed with diagnostics:
    is.environment(.envir) is not TRUE
    --- failed re-building ‘codebook.Rmd’
    
    ...
    Error: processing vignette 'codebook_tutorial.Rmd' failed with diagnostics:
    is.environment(.envir) is not TRUE
    --- failed re-building ‘codebook_tutorial.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘codebook.Rmd’ ‘codebook_qualtrics.Rmd’ ‘codebook_sav.Rmd’
      ‘codebook_tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘userfriendlyscience’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘jsonlite’ ‘rlang’ ‘tidyselect’ ‘vctrs’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# gtreg

<details>

* Version: 0.4.0
* GitHub: https://github.com/shannonpileggi/gtreg
* Source code: https://github.com/cran/gtreg
* Date/Publication: 2024-07-25 17:20:02 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "gtreg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gtreg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tbl_reg_summary
    > ### Title: Data Summary Table
    > ### Aliases: tbl_reg_summary
    > 
    > ### ** Examples
    > 
    > tbl_reg_summary_ex1 <-
    ...
     41. ├─gtsummary:::map(...)
     42. │ └─base::lapply(.x, .f, ...)
     43. │   └─gtsummary (local) FUN(X[[i]], ...)
     44. │     └─glue::glue(...)
     45. │       └─glue::glue_data(...)
     46. │         └─base::stopifnot(is.environment(.envir))
     47. │           └─base::stop(simpleError(msg, call = if (p <- sys.parent(1L)) sys.call(p)))
     48. └─dplyr (local) `<fn>`(`<smplErrr>`)
     49.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(gtreg)
      
      Attaching package: 'gtreg'
      
      The following object is masked from 'package:testthat':
    ...
       50. │     └─glue::glue(...)
       51. │       └─glue::glue_data(...)
       52. │         └─base::stopifnot(is.environment(.envir))
       53. │           └─base::stop(simpleError(msg, call = if (p <- sys.parent(1L)) sys.call(p)))
       54. └─dplyr (local) `<fn>`(`<smplErrr>`)
       55.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
      
      [ FAIL 11 | WARN 34 | SKIP 4 | PASS 65 ]
      Error: Test failures
      Execution halted
    ```

# gtsummary

<details>

* Version: 2.0.2
* GitHub: https://github.com/ddsjoberg/gtsummary
* Source code: https://github.com/cran/gtsummary
* Date/Publication: 2024-09-05 21:20:02 UTC
* Number of recursive dependencies: 184

Run `revdepcheck::cloud_details(, "gtsummary")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gtsummary-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_ci
    > ### Title: Add CI Column
    > ### Aliases: add_ci add_ci.tbl_summary
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
     39. │   ├─dplyr::same_src(x, y)
     40. │   └─dplyr:::same_src.data.frame(x, y)
     41. │     └─base::is.data.frame(y)
     42. ├─glue::glue(...)
     43. │ └─glue::glue_data(...)
     44. │   └─base::stopifnot(is.environment(.envir))
     45. │     └─base::stop(simpleError(msg, call = if (p <- sys.parent(1L)) sys.call(p)))
     46. └─dplyr (local) `<fn>`(`<smplErrr>`)
     47.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘gtsummary_definition.Rmd’ using rmarkdown
    
    Quitting from lines 27-38 [setup] (gtsummary_definition.Rmd)
    Error: processing vignette 'gtsummary_definition.Rmd' failed with diagnostics:
    ℹ In argument: `stat = as.character(...)`.
    Caused by error in `glue_data()`:
    ! is.environment(.envir) is not TRUE
    --- failed re-building ‘gtsummary_definition.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘gtsummary_definition.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# logger

<details>

* Version: 0.3.0
* GitHub: https://github.com/daroczig/logger
* Source code: https://github.com/cran/logger
* Date/Publication: 2024-03-05 16:20:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "logger")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(logger)
      > 
      > if (identical(Sys.getenv("NOT_CRAN"), "true")) {
      +     test_check('logger')
      + } else {
      +     test_check('logger', filter = '^[a-z]*$')
    ...
       16.           ├─base::do.call(...)
       17.           └─logger (local) `<fn>`(...)
       18.             └─base::tryCatch(...)
       19.               └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       20.                 └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       21.                   └─value[[3L]](cond)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 228 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'logging', 'futile.logger', 'log4r'
    ```

# odin

<details>

* Version: 1.2.5
* GitHub: https://github.com/mrc-ide/odin
* Source code: https://github.com/cran/odin
* Date/Publication: 2023-10-02 13:40:11 UTC
* Number of recursive dependencies: 57

Run `revdepcheck::cloud_details(, "odin")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘odin-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: odin_package
    > ### Title: Create odin model in a package
    > ### Aliases: odin_package
    > 
    > ### ** Examples
    > 
    > path <- tempfile()
    ...
    > # But contains odin files in inst/odin
    > dir(file.path(pkg, "inst/odin"))
    [1] "lorenz.R"
    > 
    > # Compile the odin code in the package
    > odin::odin_package(pkg)
    Error in glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open,  : 
      is.environment(.envir) is not TRUE
    Calls: <Anonymous> ... glue_whisker -> <Anonymous> -> glue_data -> stopifnot
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(odin)
      > 
      > test_check("odin")
      [ FAIL 7 | WARN 0 | SKIP 23 | PASS 1049 ]
      
      ══ Skipped tests (23) ══════════════════════════════════════════════════════════
    ...
      `expected`: TRUE 
      ── Failure ('test-odin-build.R:29:3'): build from ir ───────────────────────────
      res$error is not NULL
      
      `actual` is a character vector ('is.environment(.envir) is not TRUE')
      `expected` is NULL
      
      [ FAIL 7 | WARN 0 | SKIP 23 | PASS 1049 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘discrete.Rmd’ using rmarkdown
    
    Quitting from lines 192-194 [unnamed-chunk-2] (discrete.Rmd)
    Error: processing vignette 'discrete.Rmd' failed with diagnostics:
    is.environment(.envir) is not TRUE
    --- failed re-building ‘discrete.Rmd’
    
    --- re-building ‘functions.Rmd’ using rmarkdown
    ...
    Quitting from lines 58-59 [unnamed-chunk-3] (odin.Rmd)
    Error: processing vignette 'odin.Rmd' failed with diagnostics:
    is.environment(.envir) is not TRUE
    --- failed re-building ‘odin.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘discrete.Rmd’ ‘odin.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# params

<details>

* Version: 0.7.3
* GitHub: https://github.com/sahilseth/params
* Source code: https://github.com/cran/params
* Date/Publication: 2021-03-01 20:00:06 UTC
* Number of recursive dependencies: 53

Run `revdepcheck::cloud_details(, "params")` for more info

</details>

## Newly broken

*   checking whether package ‘params’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/params/new/params.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘params’ ...
** package ‘params’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘params’:
 .onLoad failed in loadNamespace() for 'params', details:
  call: glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open, 
  error: is.environment(.envir) is not TRUE
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/params/new/params.Rcheck/params’


```
### CRAN

```
* installing *source* package ‘params’ ...
** package ‘params’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (params)


```
# roxytypes

<details>

* Version: 0.1.0
* GitHub: https://github.com/openpharma/roxytypes
* Source code: https://github.com/cran/roxytypes
* Date/Publication: 2024-02-29 20:30:02 UTC
* Number of recursive dependencies: 44

Run `revdepcheck::cloud_details(, "roxytypes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘roxytypes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: build_format_regex
    > ### Title: Build format regular expression
    > ### Aliases: build_format_regex re_backticked re_any escape_non_glue_re
    > 
    > ### ** Examples
    > 
    > re <- roxytypes:::build_format_regex(
    +   "{as}{any}{bs}",
    +   as = "a+",
    +   bs = "b+",
    +   any = ".*?"
    + )
    Error in glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open,  : 
      is.environment(.envir) is not TRUE
    Calls: <Anonymous> -> <Anonymous> -> glue_data -> stopifnot
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
       10.       │   │ └─base::withVisible(code)
       11.       │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       12.       └─roxytypes:::build_format_regex("(`{type}`) {description}") at test-convert.R:165:5
       13.         └─glue::glue(format, .envir = as.list(keywords))
       14.           └─glue::glue_data(...)
       15.             └─base::stopifnot(is.environment(.envir))
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 170 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘roxylint’
    ```

# shinyCohortBuilder

<details>

* Version: 0.2.1
* GitHub: NA
* Source code: https://github.com/cran/shinyCohortBuilder
* Date/Publication: 2023-08-28 09:20:02 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "shinyCohortBuilder")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘shinyCohortBuilder-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pre_post_stats
    > ### Title: Generate structure of pre/post statistics
    > ### Aliases: pre_post_stats .pre_post_stats .pre_post_stats_text
    > 
    > ### ** Examples
    > 
    > .pre_post_stats(5, 10, "books")
    <span><span>books </span><span class="cb_delayed">5</span><span> / </span><span>10</span></span>
    > .pre_post_stats_text(5, 10, "books")
    Error in glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open,  : 
      is.environment(.envir) is not TRUE
    Calls: .pre_post_stats_text -> <Anonymous> -> glue_data -> stopifnot
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘custom-gui-layer.Rmd’ using rmarkdown
    --- finished re-building ‘custom-gui-layer.Rmd’
    
    --- re-building ‘gui-filter-layer.Rmd’ using rmarkdown
    
    Quitting from lines 247-253 [unnamed-chunk-16] (gui-filter-layer.Rmd)
    Error: processing vignette 'gui-filter-layer.Rmd' failed with diagnostics:
    is.environment(.envir) is not TRUE
    ...
    --- finished re-building ‘shinyCohortBuilder.Rmd’
    
    --- re-building ‘updating-source.Rmd’ using rmarkdown
    --- finished re-building ‘updating-source.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘gui-filter-layer.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) gui-filter-layer.Rd:40: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) gui-filter-layer.Rd:41: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) gui-filter-layer.Rd:42: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) gui-filter-layer.Rd:43: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) gui-filter-layer.Rd:44-45: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) gui-filter-layer.Rd:46-49: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) rendering-step-attrition.Rd:34: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) rendering-step-attrition.Rd:35: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) source-gui-layer.Rd:22: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) source-gui-layer.Rd:23: Lost braces in \itemize; meant \describe ?
    ...
    checkRd: (-1) trigger-action.Rd:39: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:40: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:41: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:42: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:43: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:44: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:45: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:46: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:47: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) trigger-action.Rd:48: Lost braces in \itemize; meant \describe ?
    ```

# sqltargets

<details>

* Version: 0.2.0
* GitHub: https://github.com/daranzolin/sqltargets
* Source code: https://github.com/cran/sqltargets
* Date/Publication: 2024-07-31 02:30:02 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "sqltargets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
       4.   └─targets:::callr_outer(...)
       5.     ├─targets:::if_any(...)
       6.     └─targets:::callr_error(traced_condition = out, fun = fun)
       7.       └─targets::tar_throw_run(message, class = class(traced_condition$condition))
       8.         └─targets::tar_error(...)
       9.           └─rlang::abort(message = message, class = class, call = tar_empty_envir)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 5 ]
      Error: Test failures
      Execution halted
    ```

# table.glue

<details>

* Version: 0.0.3
* GitHub: https://github.com/bcjaeger/table.glue
* Source code: https://github.com/cran/table.glue
* Date/Publication: 2023-02-07 08:30:02 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "table.glue")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘table.glue-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: format_big
    > ### Title: Format values left of decimal
    > ### Aliases: format_big
    > 
    > ### ** Examples
    > 
    > 
    > big_x <- 1234567
    > 
    > rspec <- format_big(round_spec(), mark = '|', interval = 3)
    > 
    > table_value(big_x, rspec) # returns "1|234|567"
    Error in glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open,  : 
      is.environment(.envir) is not TRUE
    Calls: table_value -> <Anonymous> -> glue_data -> stopifnot
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(table.glue)
      > 
      > test_check("table.glue")
      [ FAIL 11 | WARN 0 | SKIP 0 | PASS 47 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─table.glue::table_value(x, rspec_mag_up)
       5.   └─glue::glue("{round_using}_{round_half}", .envir = .rspec)
       6.     └─glue::glue_data(...)
       7.       └─base::stopifnot(is.environment(.envir))
      
      [ FAIL 11 | WARN 0 | SKIP 0 | PASS 47 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘default_rounder.Rmd’ using rmarkdown
    
    Quitting from lines 53-58 [unnamed-chunk-4] (default_rounder.Rmd)
    Error: processing vignette 'default_rounder.Rmd' failed with diagnostics:
    is.environment(.envir) is not TRUE
    --- failed re-building ‘default_rounder.Rmd’
    
    --- re-building ‘table_guide.Rmd’ using rmarkdown
    
    ...
    ! Failed to evaluate glue component {..f(height_est)}
    Caused by error in `glue_data()`:
    ! is.environment(.envir) is not TRUE
    --- failed re-building ‘table_guide.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘default_rounder.Rmd’ ‘table_guide.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) table_ester.Rd:32: Lost braces; missing escapes or markup?
        32 | inside of curly brackets, i.e., { } . For instance, if estimate = 1.23
           |                                 ^
    checkRd: (-1) table_ester.Rd:33: Lost braces; missing escapes or markup?
        33 | and error = 0.45, then \code{form} = "{estimate} ({error})" will return
           |                                       ^
    checkRd: (-1) table_ester.Rd:33: Lost braces; missing escapes or markup?
        33 | and error = 0.45, then \code{form} = "{estimate} ({error})" will return
           |                                                   ^
    ```

