# alphavantager

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘devtools’
      All declared Imports should be used.
    ```

# bigstatsr

Version: 0.2.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      'dimnames' applied to non-array
      1: sparseSVM::sparseSVM(X2, y.factor, alpha = alpha, lambda.min = lambda.min, penalty.factor = m) at testthat/test-spSVM.R:32
      
      2. Error: equality with sparseSVM with only half the data (@test-spSVM.R#68) ---
      'dimnames' applied to non-array
      1: sparseSVM::sparseSVM(X2[ind, ], y.factor[ind], alpha = alpha, lambda.min = lambda.min, 
             penalty.factor = m) at testthat/test-spSVM.R:68
      
      testthat results ================================================================
      OK: 1629 SKIPPED: 0 FAILED: 2
      1. Error: equality with sparseSVM with all data (@test-spSVM.R#32) 
      2. Error: equality with sparseSVM with only half the data (@test-spSVM.R#68) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# blastula

Version: 0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rJava’
      All declared Imports should be used.
    ```

# configr

Version: 0.3.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘config’
    ```

# dbplyr

Version: 1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# dplyr

Version: 0.7.4

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# fiery

Version: 1.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             onWSOpen = private$websocket_logic)) at .../revdep/checks/fiery/new/fiery.Rcheck/00_pkg_src/fiery/R/Fire.R:498
      8: stop("Failed to create server")
      
      testthat results ================================================================
      OK: 236 SKIPPED: 0 FAILED: 7
      1. Error: life cycle events get fired (@test-Fire.R#168) 
      2. Error: errors in start and resume gets caught (@test-Fire.R#288) 
      3. Error: futures can be added and called (@test-Fire.R#317) 
      4. Error: ignite is blocked during run (@test-Fire.R#404) 
      5. Error: external triggers are fired (@test-Fire.R#424) 
      6. Error: showcase opens a browser (@test-Fire.R#453) 
      7. Error: is_running works (@test-Fire.R#529) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘desc’
      All declared Imports should be used.
    ```

# huxtable

Version: 1.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             message = handle_message))
      4: withCallingHandlers(withVisible(code), warning = handle_warning, message = handle_message)
      5: withVisible(code)
      6: rmarkdown::render("table-tester-2.Rmd", quiet = TRUE, output_format = "pdf_document")
      7: convert(output_file, run_citeproc)
      8: pandoc_convert(utf8_input, pandoc_to, output_format$pandoc$from, output, citeproc, 
             output_format$pandoc$args, !quiet)
      9: stop("pandoc document conversion failed with error ", result, call. = FALSE)
      
      testthat results ================================================================
      OK: 290 SKIPPED: 48 FAILED: 1
      1. Error: table-tester-2.Rmd renders without errors in LaTeX (@test-with-pandoc.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘xtable’
    ```

# kokudosuuchi

Version: 0.4.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringi’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52458 marked UTF-8 strings
    ```

# mosaic

Version: 1.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘manipulate’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        R     3.1Mb
        doc   2.3Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘cubature’
    ```

# seplyr

Version: 0.1.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘datasets’
      All declared Imports should be used.
    ```

# tidyr

Version: 0.7.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 23 marked UTF-8 strings
    ```

# XKCDdata

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

