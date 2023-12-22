# diseasystore

<details>

* Version: 0.1
* GitHub: https://github.com/ssi-dk/diseasystore
* Source code: https://github.com/cran/diseasystore
* Date/Publication: 2023-12-20 16:10:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "diseasystore")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
    ...
      Caused by error in `dplyr::db_write_table()`:
      ! Can't write table table `dbplyr_045`.
      Caused by error:
      ! Invalid result set
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 469 ]
      Error: Test failures
      In addition: Warning message:
      Closing open result set, pending rows 
      Execution halted
    ```

