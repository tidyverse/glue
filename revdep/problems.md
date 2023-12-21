# codebook

<details>

* Version: 0.9.2
* GitHub: https://github.com/rubenarslan/codebook
* Source code: https://github.com/cran/codebook
* Date/Publication: 2020-06-06 23:40:03 UTC
* Number of recursive dependencies: 158

Run `revdepcheck::cloud_details(, "codebook")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘codebook.Rmd’ using rmarkdown
    Failed with error:  'there is no package called 'GGally''
    Failed with error:  'there is no package called 'GGally''
    
    Quitting from lines 17-22 [cb] (codebook.Rmd)
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

# odin

<details>

* Version: 1.2.5
* GitHub: https://github.com/mrc-ide/odin
* Source code: https://github.com/cran/odin
* Date/Publication: 2023-10-02 13:40:11 UTC
* Number of recursive dependencies: 60

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
# shinyCohortBuilder

<details>

* Version: 0.2.1
* GitHub: NA
* Source code: https://github.com/cran/shinyCohortBuilder
* Date/Publication: 2023-08-28 09:20:02 UTC
* Number of recursive dependencies: 111

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

# table.glue

<details>

* Version: 0.0.3
* GitHub: https://github.com/bcjaeger/table.glue
* Source code: https://github.com/cran/table.glue
* Date/Publication: 2023-02-07 08:30:02 UTC
* Number of recursive dependencies: 84

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

# tidytable

<details>

* Version: 0.10.2
* GitHub: https://github.com/markfairbanks/tidytable
* Source code: https://github.com/cran/tidytable
* Date/Publication: 2023-10-04 19:20:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "tidytable")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(tidytable)
      
      Attaching package: 'tidytable'
      
      The following object is masked from 'package:testthat':
      
    ...
        6. └─data.table:::`[.data.table`(...)
        7.   └─base::eval(jsub, SDenv, parent.frame())
        8.     └─base::eval(jsub, SDenv, parent.frame())
        9.       └─glue::glue(.env$names_glue, .envir = .SD)
       10.         └─glue::glue_data(...)
       11.           └─base::stopifnot(is.environment(.envir))
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 1448 ]
      Error: Test failures
      Execution halted
    ```

# vegawidget

<details>

* Version: 0.4.3
* GitHub: https://github.com/vegawidget/vegawidget
* Source code: https://github.com/cran/vegawidget
* Date/Publication: 2023-09-03 04:40:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "vegawidget")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vegawidget-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: vw_handler_add_effect
    > ### Title: Add a side-effect to a JavaScript handler
    > ### Aliases: vw_handler_add_effect
    > 
    > ### ** Examples
    > 
    >   # list all the available effect-handlers
    ...
        document.querySelector('${selector}').innerText = ${expr}
    > 
    >   # build a signal handler that prints some text,
    >   # then the value, to the console
    >   vw_handler_signal("value") %>%
    +     vw_handler_add_effect("console", label = "signal value:")
    Error in glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open,  : 
      is.environment(.envir) is not TRUE
    Calls: %>% ... <Anonymous> -> <Anonymous> -> glue_data -> stopifnot
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(vegawidget)
      > 
      > test_check("vegawidget")
      
      Attaching package: 'rlang'
      
    ...
       2. └─vegawidget::vw_handler_add_effect(., "console")
       3.   ├─base::do.call(glue_js, c(as.list(body_effect$text), list(.envir = params)))
       4.   └─vegawidget (local) `<fn>`(...)
       5.     └─glue::glue(..., .open = .open, .envir = .envir, .sep = "\n")
       6.       └─glue::glue_data(...)
       7.         └─base::stopifnot(is.environment(.envir))
      
      [ FAIL 3 | WARN 0 | SKIP 10 | PASS 95 ]
      Error: Test failures
      Execution halted
    ```

