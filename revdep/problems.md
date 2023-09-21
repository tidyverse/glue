# cpp11

<details>

* Version: 0.4.3
* GitHub: https://github.com/r-lib/cpp11
* Source code: https://github.com/cran/cpp11
* Date/Publication: 2022-10-12 08:43:54 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "cpp11")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       3.   └─base::seq.default(mid, end)
      ── Failure ('test-register.R:222:5'): generate_cpp_functions: returns the empty string if there are no functions ──
      generate_cpp_functions(funs) (`actual`) not equal to character() (`expected`).
      
      `actual`:   ""
      `expected`:   
      ── Failure ('test-register.R:391:5'): generate_r_functions: returns the empty string if there are no functions ──
      generate_r_functions(funs) (`actual`) not equal to character() (`expected`).
      
      `actual`:   ""
      `expected`:   
      
      [ FAIL 3 | WARN 0 | SKIP 2 | PASS 104 ]
      Error: Test failures
      Execution halted
    ```

# lvmisc

<details>

* Version: 0.1.1
* GitHub: https://github.com/verasls/lvmisc
* Source code: https://github.com/cran/lvmisc
* Date/Publication: 2021-04-05 15:20:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "lvmisc")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      err$message (`actual`) not equal to glue::glue("The method `my_fun` is not yet implemented \\\n      for an object of class `my_class`.") (`expected`).
      
      lines(actual) vs lines(expected)
        "The method `my_fun` is not yet implemented for an object of class `my_class`."
      - ""
      ── Failure ('test-abort.R:109:5'): abort_no_method_for_class() works in objects with multiple classes ──
      err$message (`actual`) not equal to glue::glue("The method `my_fun` is not yet implemented \\\n       for an object of classes `my_class_1` and `my_class_2`.") (`expected`).
      
      lines(actual) vs lines(expected)
        "The method `my_fun` is not yet implemented for an object of classes `my_class_1` and `my_class_2`."
      - ""
      
      [ FAIL 2 | WARN 18 | SKIP 7 | PASS 238 ]
      Error: Test failures
      Execution halted
    ```

# tinkr

<details>

* Version: 0.1.0
* GitHub: https://github.com/ropensci/tinkr
* Source code: https://github.com/cran/tinkr
* Date/Publication: 2022-08-19 12:30:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "tinkr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      `lines(actual[[2]])` is a character vector ('## Dataset', '', 'The data used:', '[data](https://example.com)', '')
      `lines(expected[[2]])` is absent
      
      [ FAIL 14 | WARN 0 | SKIP 12 | PASS 92 ]
      Deleting unused snapshots:
      • class-yarn/yarn-kilroy.md
      • class-yarn/yarn.Rmd
      • class-yarn/yarn.md
      • to_md/new-code-chunk.Rmd
      • to_md/table.md
      • to_md/to_md-works-for-Rmd.Rmd
      • to_md/to_md-works.md
      Error: Test failures
      Execution halted
    ```

