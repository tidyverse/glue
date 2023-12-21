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
# TriDimRegression

<details>

* Version: 1.0.2
* GitHub: https://github.com/alexander-pastukhov/tridim-regression
* Source code: https://github.com/cran/TriDimRegression
* Date/Publication: 2023-09-13 14:10:03 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "TriDimRegression")` for more info

</details>

## In both

*   checking whether package ‘TriDimRegression’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/TriDimRegression/new/TriDimRegression.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘TriDimRegression’ ...
** package ‘TriDimRegression’ successfully unpacked and MD5 sums checked
** using staged installation
Error in loadNamespace(x) : there is no package called ‘rstantools’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: configuration failed for package ‘TriDimRegression’
* removing ‘/tmp/workdir/TriDimRegression/new/TriDimRegression.Rcheck/TriDimRegression’


```
### CRAN

```
* installing *source* package ‘TriDimRegression’ ...
** package ‘TriDimRegression’ successfully unpacked and MD5 sums checked
** using staged installation
Error in loadNamespace(x) : there is no package called ‘rstantools’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: configuration failed for package ‘TriDimRegression’
* removing ‘/tmp/workdir/TriDimRegression/old/TriDimRegression.Rcheck/TriDimRegression’


```
