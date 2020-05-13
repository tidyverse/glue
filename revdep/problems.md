# abjutils

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/abjutils
* URL: https://github.com/abjur/abjutils
* Date/Publication: 2019-02-07 21:43:35 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"abjutils")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘httr’ ‘progress’
      All declared Imports should be used.
    Missing or unexported object: ‘devtools::use_package’
    ```

# amt

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/amt
* URL: https://github.com/jmsigner/amt
* Date/Publication: 2020-04-28 12:10:02 UTC
* Number of recursive dependencies: 169

Run `revdep_details(,"amt")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘amt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bbox
    > ### Title: Get bounding box of a track.
    > ### Aliases: bbox bbox.track_xy bbox.steps_xy
    > 
    > ### ** Examples
    > 
    > data(deer)
    > bbox(deer)
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
      libproj.so.12: cannot open shared object file: No such file or directory
    Calls: bbox ... getNamespace -> loadNamespace -> library.dynam -> dyn.load
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
      The following objects are masked from 'package:base':
      
          date, intersect, setdiff, union
      
      
      Running test_crs.R....................    0 tests    
      Running test_crs.R....................    0 tests    
      Running test_crs.R....................    0 tests    .t found, creating `track_xyt`.
      
      Running test_crs.R....................    0 tests    
      Running test_crs.R....................    0 tests    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
        unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
        libproj.so.12: cannot open shared object file: No such file or directory
      Calls: <Anonymous> ... getNamespace -> loadNamespace -> library.dynam -> dyn.load
      Execution halted
    ```

# anyflights

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/anyflights
* URL: http://github.com/simonpcouch/anyflights
* BugReports: https://github.com/simonpcouch/anyflights/issues
* Date/Publication: 2020-04-27 13:20:03 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"anyflights")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# areal

<details>

* Version: 0.1.6
* Source code: https://github.com/cran/areal
* URL: https://github.com/slu-openGIS/areal
* BugReports: https://github.com/slu-openGIS/areal/issues
* Date/Publication: 2020-05-12 12:10:02 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"areal")` for more info

</details>

## In both

*   checking whether package ‘areal’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/areal/new/areal.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘areal’ ...
** package ‘areal’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘areal’
* removing ‘/tmp/workdir/areal/new/areal.Rcheck/areal’

```
### CRAN

```
* installing *source* package ‘areal’ ...
** package ‘areal’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘areal’
* removing ‘/tmp/workdir/areal/old/areal.Rcheck/areal’

```
# autota

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/autota
* Date/Publication: 2020-03-22 07:10:09 UTC
* Number of recursive dependencies: 42

Run `revdep_details(,"autota")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘memoise’
      All declared Imports should be used.
    ```

# available

<details>

* Version: 1.0.4
* Source code: https://github.com/cran/available
* URL: https://github.com/ropenscilabs/available
* BugReports: https://github.com/ropenscilabs/available/issues
* Date/Publication: 2019-07-19 14:40:02 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"available")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package suggested but not available: ‘BiocInstaller’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# bayesplot

<details>

* Version: 1.7.1
* Source code: https://github.com/cran/bayesplot
* URL: https://mc-stan.org/bayesplot
* BugReports: https://github.com/stan-dev/bayesplot/issues/
* Date/Publication: 2019-12-01 23:00:26 UTC
* Number of recursive dependencies: 143

Run `revdep_details(,"bayesplot")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        R     1.8Mb
        doc   4.1Mb
    ```

# bcdata

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/bcdata
* URL: https://bcgov.github.io/bcdata/, https://catalogue.data.gov.bc.ca/, https://github.com/bcgov/bcdata
* BugReports: https://github.com/bcgov/bcdata/issues
* Date/Publication: 2019-12-17 06:30:03 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"bcdata")` for more info

</details>

## In both

*   checking whether package ‘bcdata’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bcdata/new/bcdata.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bcdata’ ...
** package ‘bcdata’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘bcdata’
* removing ‘/tmp/workdir/bcdata/new/bcdata.Rcheck/bcdata’

```
### CRAN

```
* installing *source* package ‘bcdata’ ...
** package ‘bcdata’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘bcdata’
* removing ‘/tmp/workdir/bcdata/old/bcdata.Rcheck/bcdata’

```
# bcmaps

<details>

* Version: 0.18.1
* Source code: https://github.com/cran/bcmaps
* URL: https://github.com/bcgov/bcmaps
* BugReports: https://github.com/bcgov/bcmaps/issues
* Date/Publication: 2020-04-29 10:30:10 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"bcmaps")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package suggested but not available: ‘lwgeom’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# bigsnpr

<details>

* Version: 1.3.0
* Source code: https://github.com/cran/bigsnpr
* URL: https://privefl.github.io/bigsnpr
* BugReports: https://github.com/privefl/bigsnpr/issues
* Date/Publication: 2020-03-09 20:00:02 UTC
* Number of recursive dependencies: 126

Run `revdep_details(,"bigsnpr")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.3Mb
      sub-directories of 1Mb or more:
        libs   8.7Mb
    ```

# biscale

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/biscale
* URL: https://github.com/slu-openGIS/biscale
* BugReports: https://github.com/slu-openGIS/biscale/issues
* Date/Publication: 2020-05-06 05:20:03 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"biscale")` for more info

</details>

## In both

*   checking whether package ‘biscale’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/biscale/new/biscale.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘biscale’ ...
** package ‘biscale’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘biscale’
* removing ‘/tmp/workdir/biscale/new/biscale.Rcheck/biscale’

```
### CRAN

```
* installing *source* package ‘biscale’ ...
** package ‘biscale’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘biscale’
* removing ‘/tmp/workdir/biscale/old/biscale.Rcheck/biscale’

```
# brms

<details>

* Version: 2.12.0
* Source code: https://github.com/cran/brms
* URL: https://github.com/paul-buerkner/brms, http://discourse.mc-stan.org
* BugReports: https://github.com/paul-buerkner/brms/issues
* Date/Publication: 2020-02-23 17:30:09 UTC
* Number of recursive dependencies: 154

Run `revdep_details(,"brms")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R     3.5Mb
        doc   2.6Mb
    ```

# bsplus

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/bsplus
* URL: https://github.com/ijlyttle/bsplus
* BugReports: https://github.com/ijlyttle/bsplus/issues
* Date/Publication: 2018-04-05 18:39:46 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"bsplus")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# cabinets

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/cabinets
* Date/Publication: 2020-01-27 15:10:02 UTC
* Number of recursive dependencies: 54

Run `revdep_details(,"cabinets")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘here’ ‘withr’
      All declared Imports should be used.
    ```

# canvasXpress

<details>

* Version: 1.27.6-1
* Source code: https://github.com/cran/canvasXpress
* URL: https://github.com/neuhausi/canvasXpress.git
* BugReports: https://github.com/neuhausi/canvasXpress/issues
* Date/Publication: 2020-04-11 16:20:02 UTC
* Number of recursive dependencies: 69

Run `revdep_details(,"canvasXpress")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package suggested but not available: ‘limma’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# casen

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/casen
* URL: https://pachamaltese.github.io/casen/
* BugReports: https://github.com/pachamaltese/casen/issues
* Date/Publication: 2020-04-08 06:00:02 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"casen")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘janitor’ ‘tibble’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 75 marked UTF-8 strings
    ```

# codebook

<details>

* Version: 0.8.2
* Source code: https://github.com/cran/codebook
* URL: https://github.com/rubenarslan/codebook
* BugReports: https://github.com/rubenarslan/codebook/issues
* Date/Publication: 2020-01-09 16:20:07 UTC
* Number of recursive dependencies: 178

Run `revdep_details(,"codebook")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘jsonlite’ ‘pander’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# codemetar

<details>

* Version: 0.1.8
* Source code: https://github.com/cran/codemetar
* URL: https://github.com/ropensci/codemetar, https://ropensci.github.io/codemetar
* BugReports: https://github.com/ropensci/codemetar/issues
* Date/Publication: 2019-04-22 04:20:03 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"codemetar")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘memoise’
      All declared Imports should be used.
    ```

# compboost

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/compboost
* Date/Publication: 2018-10-28 19:10:10 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"compboost")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 23.2Mb
      sub-directories of 1Mb or more:
        libs  22.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘checkmate’ ‘methods’
      All declared Imports should be used.
    ```

# configr

<details>

* Version: 0.3.4
* Source code: https://github.com/cran/configr
* URL: https://github.com/Miachol/configr
* BugReports: https://github.com/Miachol/configr/issues
* Date/Publication: 2018-11-13 18:10:02 UTC
* Number of recursive dependencies: 41

Run `revdep_details(,"configr")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘config’
    ```

# conflr

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/conflr
* URL: https://line.github.io/conflr/, https://github.com/line/conflr
* BugReports: https://github.com/line/conflr/issues
* Date/Publication: 2020-04-08 12:50:02 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"conflr")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# congressbr

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/congressbr
* Date/Publication: 2019-12-12 11:20:02 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"congressbr")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# covid19france

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/covid19france
* Date/Publication: 2020-04-14 16:10:02 UTC
* Number of recursive dependencies: 44

Run `revdep_details(,"covid19france")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lubridate’
      All declared Imports should be used.
    ```

# CrossClustering

<details>

* Version: 4.0.3
* Source code: https://github.com/cran/CrossClustering
* URL: https://CRAN.R-project.org/package=CrossClustering
* BugReports: https://github.com/CorradoLanera/CrossClustering/issues
* Date/Publication: 2018-07-30 15:50:06 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"CrossClustering")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘glue’
      All declared Imports should be used.
    ```

# detrendr

<details>

* Version: 0.6.6
* Source code: https://github.com/cran/detrendr
* URL: https://rorynolan.github.io/detrendr, https://www.github.com/rorynolan/detrendr#readme
* BugReports: https://www.github.com/rorynolan/detrendr/issues
* Date/Publication: 2020-05-08 13:20:02 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"detrendr")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.8Mb
      sub-directories of 1Mb or more:
        libs   6.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘matrixStats’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# devtools

<details>

* Version: 2.3.0
* Source code: https://github.com/cran/devtools
* URL: https://devtools.r-lib.org/, https://github.com/r-lib/devtools
* BugReports: https://github.com/r-lib/devtools/issues
* Date/Publication: 2020-04-10 23:20:11 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"devtools")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      callr subprocess failed: Vignette re-building failed.
      Backtrace:
       1. devtools::build_vignettes(pkg)
       2. callr::r(...)
       3. callr:::get_result(output = out, options)
       4. throw(newerr, parent = remerr[[2]])
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 54 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: Sweave vignettes copied into doc (@test-vignettes.R#13) 
      2. Error: Built files are updated (@test-vignettes.R#30) 
      3. Error: Extra files copied and removed (@test-vignettes.R#84) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# DiagrammeR

<details>

* Version: 1.0.6.1
* Source code: https://github.com/cran/DiagrammeR
* URL: https://github.com/rich-iannone/DiagrammeR
* BugReports: https://github.com/rich-iannone/DiagrammeR/issues
* Date/Publication: 2020-05-08 21:40:02 UTC
* Number of recursive dependencies: 86

Run `revdep_details(,"DiagrammeR")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.2Mb
      sub-directories of 1Mb or more:
        doc           9.7Mb
        htmlwidgets   2.9Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# DirectEffects

<details>

* Version: 0.2
* Source code: https://github.com/cran/DirectEffects
* URL: http://www.mattblackwell.org/software/direct-effects/
* BugReports: https://github.com/mattblackwell/DirectEffects/issues
* Date/Publication: 2019-01-04 10:00:08 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"DirectEffects")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘sandwich’
      All declared Imports should be used.
    ```

# dplyr

<details>

* Version: 0.8.5
* Source code: https://github.com/cran/dplyr
* URL: http://dplyr.tidyverse.org, https://github.com/tidyverse/dplyr
* BugReports: https://github.com/tidyverse/dplyr/issues
* Date/Publication: 2020-03-07 12:20:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"dplyr")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 31.1Mb
      sub-directories of 1Mb or more:
        libs  28.7Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# dynwrap

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/dynwrap
* URL: https://github.com/dynverse/dynwrap
* BugReports: https://github.com/dynverse/dynwrap/issues
* Date/Publication: 2020-03-09 15:10:02 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"dynwrap")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘FNN’
      All declared Imports should be used.
    ```

# eph

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/eph
* URL: https://github.com/holatam/eph
* BugReports: https://github.com/holatam/eph/issues
* Date/Publication: 2020-03-08 16:10:02 UTC
* Number of recursive dependencies: 132

Run `revdep_details(,"eph")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘eph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_agglomerates
    > ### Title: Mapa de indicadores por aglomerado
    > ### Aliases: map_agglomerates
    > 
    > ### ** Examples
    > 
    > 
    > toybase_individual_2016_04 %>%
    + dplyr::group_by(AGLOMERADO) %>%
    + dplyr::summarise(tasa_actividad = sum(PONDERA[ESTADO==1])/sum(PONDERA)) %>%
    + map_agglomerates(agglomerates = AGLOMERADO,indicator = tasa_actividad)
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
      libproj.so.12: cannot open shared object file: No such file or directory
    Calls: %>% ... getNamespace -> loadNamespace -> library.dynam -> dyn.load
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9. eph::map_agglomerates(., agglomerates = AGLOMERADO, indicator = tasa_actividad)
       12. sf::st_as_sf(.)
       26. base::getExportedValue(pkg, name)
       27. base::asNamespace(ns)
       28. base::getNamespace(ns)
       29. base::loadNamespace(name)
       30. base::library.dynam(lib, package, package.lib)
       31. base::dyn.load(file, DLLpath = DLLpath, ...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 14 | SKIPPED: 3 | WARNINGS: 2 | FAILED: 1 ]
      1. Error: tabla simple (@test-map_agglomerates.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘readr’ ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 122 marked UTF-8 strings
    ```

# febr

<details>

* Version: 1.1.0
* Source code: https://github.com/cran/febr
* URL: https://github.com/febr-team/febr-package/
* BugReports: https://github.com/febr-team/febr-package/issues/
* Date/Publication: 2020-03-17 17:20:02 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"febr")` for more info

</details>

## In both

*   checking whether package ‘febr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/febr/new/febr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘febr’ ...
** package ‘febr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘febr’:
 .onAttach failed in attachNamespace() for 'febr', details:
  call: NULL
  error: package(s) needed for febr to work but not installed: sf
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/febr/new/febr.Rcheck/febr’

```
### CRAN

```
* installing *source* package ‘febr’ ...
** package ‘febr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘febr’:
 .onAttach failed in attachNamespace() for 'febr', details:
  call: NULL
  error: package(s) needed for febr to work but not installed: sf
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/febr/old/febr.Rcheck/febr’

```
# flair

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/flair
* URL: https://github.com/kbodwin/flair, https://kbodwin.github.io/flair/index.html
* BugReports: https://github.com/kbodwin/flair/issues
* Date/Publication: 2020-04-23 18:00:05 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"flair")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘evaluate’ ‘ggplot2’
      All declared Imports should be used.
    ```

# funneljoin

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/funneljoin
* Date/Publication: 2019-12-20 14:30:02 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"funneljoin")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# geouy

<details>

* Version: 0.1.9
* Source code: https://github.com/cran/geouy
* BugReports: https://github.com/RichDeto/geouy/issues
* Date/Publication: 2020-03-26 15:50:02 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"geouy")` for more info

</details>

## In both

*   checking whether package ‘geouy’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/geouy/new/geouy.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘geouy’ ...
** package ‘geouy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘geouy’
* removing ‘/tmp/workdir/geouy/new/geouy.Rcheck/geouy’

```
### CRAN

```
* installing *source* package ‘geouy’ ...
** package ‘geouy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘geouy’
* removing ‘/tmp/workdir/geouy/old/geouy.Rcheck/geouy’

```
# geoviz

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/geoviz
* URL: https://github.com/neilcharles/geoviz/
* Date/Publication: 2020-01-12 10:50:02 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"geoviz")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘geoviz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_gps_to_rayshader
    > ### Title: Adds a GPS trace to a 'rayshader' scene
    > ### Aliases: add_gps_to_rayshader
    > 
    > ### ** Examples
    > 
    > flight <- example_igc()
    > add_gps_to_rayshader(example_raster(),
    +   flight$lat,
    +   flight$long,
    +   flight$altitude,
    +   zscale = 25)
    Error in .rasterObjectFromFile(x, band = band, objecttype = "RasterLayer",  : 
      Cannot create RasterLayer object from this file; perhaps you need to install rgdal first
    Calls: add_gps_to_rayshader ... <Anonymous> -> <Anonymous> -> .local -> .rasterObjectFromFile
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("geoviz")
      ── 1. Error: (unknown) (@test_imagery.R#6)  ────────────────────────────────────
      Cannot create RasterLayer object from this file; perhaps you need to install rgdal first
      Backtrace:
       1. geoviz::example_raster()
       3. raster::raster(system.file("extdata/example.tif", package = "geoviz"))
       4. raster:::.local(x, ...)
       5. raster:::.rasterObjectFromFile(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test_imagery.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gganimate

<details>

* Version: 1.0.5
* Source code: https://github.com/cran/gganimate
* URL: https://gganimate.com, https://github.com/thomasp85/gganimate
* BugReports: https://github.com/thomasp85/gganimate/issues
* Date/Publication: 2020-02-09 19:50:02 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"gganimate")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package suggested but not available: ‘av’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ggplot2

<details>

* Version: 3.3.0
* Source code: https://github.com/cran/ggplot2
* URL: http://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2
* BugReports: https://github.com/tidyverse/ggplot2/issues
* Date/Publication: 2020-03-05 16:00:02 UTC
* Number of recursive dependencies: 149

Run `revdep_details(,"ggplot2")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘mgcv’
      All declared Imports should be used.
    ```

# ggpol

<details>

* Version: 0.0.6
* Source code: https://github.com/cran/ggpol
* URL: https://github.com/erocoar/ggpol
* Date/Publication: 2020-03-28 14:10:02 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"ggpol")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘grDevices’
      All declared Imports should be used.
    ```

# ggpubr

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/ggpubr
* URL: https://rpkgs.datanovia.com/ggpubr/
* BugReports: https://github.com/kassambara/ggpubr/issues
* Date/Publication: 2020-05-04 09:00:03 UTC
* Number of recursive dependencies: 103

Run `revdep_details(,"ggpubr")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggspatial

<details>

* Version: 1.1.1
* Source code: https://github.com/cran/ggspatial
* URL: https://paleolimbot.github.io/ggspatial, https://github.com/paleolimbot/ggspatial
* BugReports: https://github.com/paleolimbot/ggspatial/issues
* Date/Publication: 2020-04-27 14:10:11 UTC
* Number of recursive dependencies: 130

Run `revdep_details(,"ggspatial")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘lwgeom’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ggthemes

<details>

* Version: 4.2.0
* Source code: https://github.com/cran/ggthemes
* URL: http://github.com/jrnold/ggthemes
* BugReports: http://github.com/jrnold/ggthemes
* Date/Publication: 2019-05-13 09:10:03 UTC
* Number of recursive dependencies: 122

Run `revdep_details(,"ggthemes")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# gt

<details>

* Version: 0.2.0.5
* Source code: https://github.com/cran/gt
* URL: https://github.com/rstudio/gt
* BugReports: https://github.com/rstudio/gt/issues
* Date/Publication: 2020-03-31 10:10:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"gt")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      The following object is masked from 'package:testthat':
      
          matches
      
      > 
      > test_check("gt")
      ── 1. Failure: the correct color values are obtained when defining a palette (@t
      ``%>%`(...)` did not throw an error.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 2063 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: the correct color values are obtained when defining a palette (@test-data_color.R#630) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        help   5.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 116 marked UTF-8 strings
    ```

# hardhat

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/hardhat
* URL: https://github.com/tidymodels/hardhat
* BugReports: https://github.com/tidymodels/hardhat/issues
* Date/Publication: 2020-02-28 07:20:16 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"hardhat")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. testthat::expect_error(...)
        8. vctrs::vec_default_cast(...)
        9. vctrs::stop_incompatible_cast(...)
       10. vctrs::stop_incompatible_type(...)
       11. vctrs:::stop_incompatible(...)
       12. vctrs:::stop_vctrs(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 402 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: missing ordered factor levels are handled correctly (@test-forge-formula.R#510) 
      2. Failure: ignoring novel levels still passes through incompatible classes (@test-scream.R#50) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# IMWatson

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/IMWatson
* Date/Publication: 2019-03-29 16:40:03 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"IMWatson")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘V8’ ‘assertive’ ‘shinydashboard’
      All declared Imports should be used.
    ```

# infer

<details>

* Version: 0.5.1
* Source code: https://github.com/cran/infer
* URL: https://github.com/tidymodels/infer, https://infer.netlify.com/
* BugReports: https://github.com/tidymodels/infer/issues
* Date/Publication: 2019-11-19 10:30:02 UTC
* Number of recursive dependencies: 115

Run `revdep_details(,"infer")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lifecycle’
      All declared Imports should be used.
    ```

# interactions

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/interactions
* URL: https://interactions.jacob-long.com
* BugReports: https://github.com/jacob-long/interactions/issues
* Date/Publication: 2020-04-04 14:30:02 UTC
* Number of recursive dependencies: 135

Run `revdep_details(,"interactions")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'brms', 'rstanarm'
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘quantreg’, ‘brms’, ‘effects’, ‘Hmisc’, ‘rockchalk’, ‘pequod’
    ```

# kokudosuuchi

<details>

* Version: 0.4.2
* Source code: https://github.com/cran/kokudosuuchi
* URL: https://github.com/yutannihilation/kokudosuuchi
* BugReports: https://github.com/yutannihilation/kokudosuuchi/issues
* Date/Publication: 2018-01-26 04:21:18 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"kokudosuuchi")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. sf::st_sf
       2. base::getExportedValue(pkg, name)
       3. base::asNamespace(ns)
       4. base::getNamespace(ns)
       5. base::loadNamespace(name)
       6. base::library.dynam(lib, package, package.lib)
       7. base::dyn.load(file, DLLpath = DLLpath, ...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 14 | SKIPPED: 8 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: translateKSJData() works for both a sf object and a list of sf objects (@test-translateData.R#26) 
      2. Error: translateKSJData() works for colnames with years (@test-translateData.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52458 marked UTF-8 strings
    ```

# logger

<details>

* Version: 0.1
* Source code: https://github.com/cran/logger
* URL: https://github.com/daroczig/logger
* Date/Publication: 2019-01-02 15:30:03 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"logger")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'logging', 'futile.logger', 'log4r'
    ```

# mlflow

<details>

* Version: 1.8.0
* Source code: https://github.com/cran/mlflow
* URL: https://github.com/mlflow/mlflow
* BugReports: https://github.com/mlflow/mlflow/issues
* Date/Publication: 2020-04-22 05:00:02 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"mlflow")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package required and available but unsuitable version: ‘stringi’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# moderndive

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/moderndive
* URL: https://github.com/ModernDive/moderndive_package
* BugReports: https://github.com/ModernDive/moderndive_package/issues
* Date/Publication: 2019-11-04 05:40:02 UTC
* Number of recursive dependencies: 120

Run `revdep_details(,"moderndive")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ggplot2movies’, ‘openintro’
    ```

# mosaic

<details>

* Version: 1.6.0
* Source code: https://github.com/cran/mosaic
* URL: https://github.com/ProjectMOSAIC/mosaic, https://projectmosaic.github.io/mosaic/
* BugReports: https://github.com/ProjectMOSAIC/mosaic/issues
* Date/Publication: 2020-03-06 18:00:03 UTC
* Number of recursive dependencies: 152

Run `revdep_details(,"mosaic")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package suggested but not available: ‘fastR’
    
    Package which this enhances but not available for checking: ‘manipulate’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# mrgsolve

<details>

* Version: 0.10.1
* Source code: https://github.com/cran/mrgsolve
* URL: https://github.com/metrumresearchgroup/mrgsolve
* BugReports: https://github.com/metrumresearchgroup/mrgsolve/issues
* Date/Publication: 2020-02-21 06:00:02 UTC
* Number of recursive dependencies: 52

Run `revdep_details(,"mrgsolve")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.6Mb
      sub-directories of 1Mb or more:
        libs   6.9Mb
    ```

# mudata2

<details>

* Version: 1.1.2
* Source code: https://github.com/cran/mudata2
* URL: https://paleolimbot.github.io/mudata2, https://github.com/paleolimbot/mudata2
* BugReports: https://github.com/paleolimbot/mudata2/issues
* Date/Publication: 2020-03-20 20:20:03 UTC
* Number of recursive dependencies: 86

Run `revdep_details(,"mudata2")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 881 | SKIPPED: 2 | WARNINGS: 8 | FAILED: 12 ]
      1. Error: mudata_prepare_column and mudata_parse_column are opposites (@test-mudata-io.R#267) 
      2. Error: mudata_prepare_tbl works as intended (@test-mudata-io.R#311) 
      3. Error: mudata_prepare_tbl and mudata_parse_tbl are opposites (@test-mudata-io.R#345) 
      4. Failure: as_* functions produce the expected output type (@test-types.R#210) 
      5. Failure: wkt parsing returns an sf::sfc (@test-types.R#252) 
      6. Failure: wkt parsing works when there are parsing errors/NA values (@test-types.R#259) 
      7. Error: wkt parsing works when there are parsing errors/NA values (@test-types.R#261) 
      8. Failure: wkt parsing works with zero-length input (@test-types.R#285) 
      9. Failure: objects generate the correct type strings (@test-types.R#306) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# multicolor

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/multicolor
* URL: http://github.com/aedobbyn/multicolor/
* BugReports: https://github.com/aedobbyn/multicolor/issues/
* Date/Publication: 2020-02-03 16:50:02 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"multicolor")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘cowsay’
      All declared Imports should be used.
    ```

# neo4r

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/neo4r
* URL: https://github.com/neo4j-rstats/neo4r
* BugReports: https://github.com/neo4j-rstats/neo4r/issues
* Date/Publication: 2019-02-15 22:20:03 UTC
* Number of recursive dependencies: 45

Run `revdep_details(,"neo4r")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘igraph’ ‘rlang’ ‘tidyselect’
      All declared Imports should be used.
    ```

# onelogin

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/onelogin
* Date/Publication: 2019-08-07 14:00:02 UTC
* Number of recursive dependencies: 20

Run `revdep_details(,"onelogin")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘safer’
      All declared Imports should be used.
    ```

# pathlibr

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/pathlibr
* Date/Publication: 2019-02-22 14:40:06 UTC
* Number of recursive dependencies: 40

Run `revdep_details(,"pathlibr")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘glue’ ‘logging’ ‘purrr’
      All declared Imports should be used.
    ```

# photosynthesis

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/photosynthesis
* Date/Publication: 2019-05-09 15:10:03 UTC
* Number of recursive dependencies: 73

Run `revdep_details(,"photosynthesis")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# pkgcache

<details>

* Version: 1.0.7
* Source code: https://github.com/cran/pkgcache
* URL: https://github.com/r-lib/pkgcache#readme
* BugReports: https://github.com/r-lib/pkgcache/issues
* Date/Publication: 2020-04-18 05:20:08 UTC
* Number of recursive dependencies: 48

Run `revdep_details(,"pkgcache")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘test-async.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
       1. pkgcache:::read_packages_file(...)
       3. pkgcache:::read.dcf.gz(path)
       4. base::gzfile(x, open = "r")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 271 | SKIPPED: 29 | WARNINGS: 3 | FAILED: 5 ]
      1. Error: load_primary_pkgs (@test-metadata-cache.R#177) 
      2. Error: update_replica_rds (@test-metadata-cache.R#236) 
      3. Error: read_packages_file (@test-packages-gz.R#63) 
      4. Error: packages_parse_deps (@test-packages-gz.R#71) 
      5. Error: merge_packages_data (@test-packages-gz.R#88) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pkgnet

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/pkgnet
* URL: https://github.com/uptake/pkgnet, https://uptake.github.io/pkgnet/
* BugReports: https://github.com/uptake/pkgnet/issues
* Date/Publication: 2020-04-06 10:10:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"pkgnet")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘pkgdown’
    ```

# pointblank

<details>

* Version: 0.3.1.1
* Source code: https://github.com/cran/pointblank
* URL: https://github.com/rich-iannone/pointblank
* BugReports: https://github.com/rich-iannone/pointblank/issues
* Date/Publication: 2020-04-02 08:40:03 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"pointblank")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘scales’
      All declared Imports should be used.
    ```

# poissonreg

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/poissonreg
* URL: https://github.com/tidymodels/poissonreg
* BugReports: https://github.com/tidymodels/poissonreg/issues
* Date/Publication: 2020-04-14 14:40:10 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"poissonreg")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘tidyr’
      All declared Imports should be used.
    ```

# purrrogress

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/purrrogress
* URL: https://github.com/halpo/purrrogress
* BugReports: https://github.com/halpo/purrrogress/issues
* Date/Publication: 2019-07-22 21:10:08 UTC
* Number of recursive dependencies: 48

Run `revdep_details(,"purrrogress")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘dplyr’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘hms’
      All declared Imports should be used.
    ```

# qsub

<details>

* Version: 1.1.0
* Source code: https://github.com/cran/qsub
* URL: http://github.com/rcannood/qsub
* BugReports: https://github.com/rcannood/qsub/issues
* Date/Publication: 2019-02-13 13:20:04 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"qsub")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘ssh’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# qualmap

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/qualmap
* URL: https://github.com/slu-openGIS/qualmap
* BugReports: https://github.com/slu-openGIS/qualmap/issues
* Date/Publication: 2018-09-12 15:10:14 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"qualmap")` for more info

</details>

## In both

*   checking whether package ‘qualmap’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/qualmap/new/qualmap.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘qualmap’ ...
** package ‘qualmap’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘qualmap’
* removing ‘/tmp/workdir/qualmap/new/qualmap.Rcheck/qualmap’

```
### CRAN

```
* installing *source* package ‘qualmap’ ...
** package ‘qualmap’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/sf/libs/sf.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘qualmap’
* removing ‘/tmp/workdir/qualmap/old/qualmap.Rcheck/qualmap’

```
# reproducible

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/reproducible
* URL: https://reproducible.predictiveecology.org, https://github.com/PredictiveEcology/reproducible
* BugReports: https://github.com/PredictiveEcology/reproducible/issues
* Date/Publication: 2020-02-20 17:30:02 UTC
* Number of recursive dependencies: 122

Run `revdep_details(,"reproducible")` for more info

</details>

## In both

*   checking whether package ‘reproducible’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/reproducible/new/reproducible.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘reproducible’ ...
** package ‘reproducible’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘reproducible’
* removing ‘/tmp/workdir/reproducible/new/reproducible.Rcheck/reproducible’

```
### CRAN

```
* installing *source* package ‘reproducible’ ...
** package ‘reproducible’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘reproducible’
* removing ‘/tmp/workdir/reproducible/old/reproducible.Rcheck/reproducible’

```
# rKolada

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/rKolada
* Date/Publication: 2020-05-12 13:50:02 UTC
* Number of recursive dependencies: 70

Run `revdep_details(,"rKolada")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggplot2’ ‘stringi’
      All declared Imports should be used.
    ```

# sapfluxnetr

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/sapfluxnetr
* URL: https://github.com/sapfluxnet/sapfluxnetr
* BugReports: https://github.com/sapfluxnet/sapfluxnetr/issues
* Date/Publication: 2020-05-11 12:50:07 UTC
* Number of recursive dependencies: 74

Run `revdep_details(,"sapfluxnetr")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# shinyloadtest

<details>

* Version: 1.0.1
* Source code: https://github.com/cran/shinyloadtest
* URL: https://rstudio.github.io/shinyloadtest/, https://github.com/rstudio/shinyloadtest
* BugReports: https://github.com/rstudio/shinyloadtest/issues
* Date/Publication: 2020-01-09 10:20:02 UTC
* Number of recursive dependencies: 92

Run `revdep_details(,"shinyloadtest")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘getPass’ ‘svglite’ ‘websocket’
      All declared Imports should be used.
    ```

# shinypanels

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/shinypanels
* URL: http://github.com/datasketch/shinypanels
* Date/Publication: 2020-01-26 10:30:08 UTC
* Number of recursive dependencies: 37

Run `revdep_details(,"shinypanels")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘shiny’ ‘shinyjs’
      All declared Imports should be used.
    ```

# slider

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/slider
* URL: https://github.com/DavisVaughan/slider
* BugReports: https://github.com/DavisVaughan/slider/issues
* Date/Publication: 2020-03-10 15:10:02 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"slider")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > # `hop()` let's you manually specify locations to apply `.f` at.
    > hop(1:3, .starts = c(1, 3), .stops = 3, ~.x)
    [[1]]
    [1] 1 2 3
    
    [[2]]
    [1] 3
    
    > 
    > # `hop()`'s start/stop locations are allowed to be out of bounds relative
    > # to the size of `.x`.
    > hop(
    +   mtcars,
    +   .starts = c(-1, 3),
    +   .stops  = c(2, 6),
    +   ~.x
    + )
    Error: The size of `names`, 32, must be the same as the size of `x`, 2.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 566 | SKIPPED: 9 | WARNINGS: 0 | FAILED: 42 ]
      1. Error: inner type is allowed to be different (@test-hop-index-vec.R#12) 
      2. Failure: inner type can be restricted with list_of (@test-hop-index-vec.R#19) 
      3. Error: .ptype is respected (@test-hop-index-vec.R#31) 
      4. Failure: names are not placed on data frames rownames (@test-hop-index-vec.R#122) 
      5. Error: inner type is allowed to be different (@test-hop-vec.R#12) 
      6. Failure: inner type can be restricted with list_of (@test-hop-vec.R#19) 
      7. Error: .ptype is respected (@test-hop-vec.R#31) 
      8. Failure: names are not placed on data frames rownames (@test-hop-vec.R#97) 
      9. Error: pslide_index_chr() can coerce (@test-pslide-index-vec.R#54) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# SpatialKDE

<details>

* Version: 0.6.1
* Source code: https://github.com/cran/SpatialKDE
* URL: https://jancaha.github.io/SpatialKDE/index.html, https://github.com/JanCaha/SpatialKDE
* Date/Publication: 2020-04-16 12:30:02 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"SpatialKDE")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package suggested but not available: ‘tmap’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# spread

<details>

* Version: 2019.8.5
* Source code: https://github.com/cran/spread
* Date/Publication: 2019-08-20 15:50:02 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"spread")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppProgress’
      All declared Imports should be used.
    ```

# stringr

<details>

* Version: 1.4.0
* Source code: https://github.com/cran/stringr
* URL: http://stringr.tidyverse.org, https://github.com/tidyverse/stringr
* BugReports: https://github.com/tidyverse/stringr/issues
* Date/Publication: 2019-02-10 03:40:03 UTC
* Number of recursive dependencies: 46

Run `revdep_details(,"stringr")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 3 marked UTF-8 strings
    ```

# tailr

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/tailr
* URL: https://github.com/mailund/tailr
* BugReports: https://github.com/mailund/tailr/issues
* Date/Publication: 2018-12-20 13:10:03 UTC
* Number of recursive dependencies: 38

Run `revdep_details(,"tailr")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package suggested but not available: ‘pmatch’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# tealeaves

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/tealeaves
* Date/Publication: 2019-05-04 16:40:03 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"tealeaves")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggplot2’ ‘tidyr’
      All declared Imports should be used.
    ```

# textclean

<details>

* Version: 0.9.3
* Source code: https://github.com/cran/textclean
* URL: https://github.com/trinker/textclean
* BugReports: https://github.com/trinker/textclean/issues
* Date/Publication: 2018-07-23 16:40:03 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"textclean")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lexicon’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘gsubfn’
    ```

# tidyr

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/tidyr
* URL: https://tidyr.tidyverse.org, https://github.com/tidyverse/tidyr
* BugReports: https://github.com/tidyverse/tidyr/issues
* Date/Publication: 2020-05-07 08:40:02 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"tidyr")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# TITAN2

<details>

* Version: 2.4
* Source code: https://github.com/cran/TITAN2
* Date/Publication: 2019-12-05 09:00:05 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"TITAN2")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘snow’
      All declared Imports should be used.
    ```

# trip

<details>

* Version: 1.6.0
* Source code: https://github.com/cran/trip
* URL: https://github.com/mdsumner/trip
* BugReports: https://github.com/mdsumner/trip/issues
* Date/Publication: 2019-04-15 14:22:39 UTC
* Number of recursive dependencies: 103

Run `revdep_details(,"trip")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
    > tr$temp <- sort(runif(nrow(tr)))
    > r <- rasterize(tr)
    > 
    > rasterize(tr, grid = r)
    class      : RasterLayer 
    dimensions : 100, 100, 10000  (nrow, ncol, ncell)
    resolution : 0.09090909, 0.02455464  (x, y)
    extent     : 0.9545455, 10.04545, -0.8479059, 1.607558  (xmin, xmax, ymin, ymax)
    crs        : +proj=laea +ellps=sphere 
    source     : memory
    names      : z 
    values     : 0, 0.09090909  (min, max)
    
    > rasterize(tr, r, field = "temp")
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
      libproj.so.12: cannot open shared object file: No such file or directory
    Error in spTransform(x, sp::CRS(CRSobj), ...) : 
      This method requires the rgdal package,but is unable to load rgdal namespace
    Calls: rasterize ... spTransform -> spTransform -> spTransform -> spTransform
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. trip::write_track_kml(walrus818[1:100, ], kml_file = outfile)
        8. sp::spTransform(obj, "+init=epsg:4326")
       10. trip:::spTransform(x, sp::CRS(CRSobj), ...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 96 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: speedfilter and sdafilter works (@test-algos.R#23) 
      2. Error: angle calculation works (@test-algos.R#35) 
      3. Error: home distance works (@test-algos.R#61) 
      4. Error: distance gives comparable values (@test-distances.R#21) 
      5. Error: trip works (@test-trip.R#22) 
      6. Error: write KML works 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# usethis

<details>

* Version: 1.6.1
* Source code: https://github.com/cran/usethis
* URL: https://usethis.r-lib.org, https://github.com/r-lib/usethis
* BugReports: https://github.com/r-lib/usethis/issues
* Date/Publication: 2020-04-29 05:50:02 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"usethis")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘devtools’
    ```

# varsExplore

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/varsExplore
* Date/Publication: 2019-10-03 07:40:02 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"varsExplore")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rio’
      All declared Imports should be used.
    ```

# vdiffr

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/vdiffr
* URL: https://github.com/r-lib/vdiffr
* BugReports: https://github.com/r-lib/vdiffr/issues
* Date/Publication: 2019-06-24 16:30:03 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"vdiffr")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘freetypeharfbuzz’
      All declared Imports should be used.
    ```

# vizdraws

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/vizdraws
* URL: http://github.com/ignacio82/vizdraws, http://ignacio82.github.io/vizdraws
* Date/Publication: 2020-04-28 08:50:02 UTC
* Number of recursive dependencies: 38

Run `revdep_details(,"vizdraws")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘glue’ ‘tidyr’
      All declared Imports should be used.
    ```

# vroom

<details>

* Version: 1.2.1
* Source code: https://github.com/cran/vroom
* URL: https://vroom.r-lib.org, https://github.com/r-lib/vroom
* BugReports: https://github.com/r-lib/vroom/issues
* Date/Publication: 2020-05-12 22:00:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"vroom")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.1Mb
      sub-directories of 1Mb or more:
        libs  14.4Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘usethis’
    ```

# XKCDdata

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/XKCDdata
* Date/Publication: 2017-10-11 12:07:59 UTC
* Number of recursive dependencies: 44

Run `revdep_details(,"XKCDdata")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# ymlthis

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/ymlthis
* URL: https://ymlthis.r-lib.org, https://github.com/r-lib/ymlthis
* BugReports: https://github.com/r-lib/ymlthis/issues
* Date/Publication: 2020-02-03 23:00:02 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"ymlthis")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘miniUI’ ‘shinyBS’
      All declared Imports should be used.
    ```

