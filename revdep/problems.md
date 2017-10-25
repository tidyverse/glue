# dplyr

Version: 0.7.4

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      2. Failure: errors for bad inputs (@test-pull.R#49) ----------------------------
      error$message does not match "`var` must be a value between -26 and 26 (excluding zero), not NA".
      Actual value: "<NA>"
      
      
      testthat results ================================================================
      OK: 2677 SKIPPED: 6 FAILED: 2
      1. Failure: errors for bad inputs (@test-pull.R#44) 
      2. Failure: errors for bad inputs (@test-pull.R#49) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# tidyselect

Version: 0.2.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Actual value: "<NA>"
      
      
      2. Failure: errors for bad inputs (@test-vars-pull.R#31) -----------------------
      error$message does not match "`var` must be a value between -26 and 26 (excluding zero), not NA".
      Actual value: "<NA>"
      
      
      testthat results ================================================================
      OK: 164 SKIPPED: 0 FAILED: 2
      1. Failure: errors for bad inputs (@test-vars-pull.R#26) 
      2. Failure: errors for bad inputs (@test-vars-pull.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

