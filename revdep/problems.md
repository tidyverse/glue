# abjutils

Version: 0.2.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# annovarR

Version: 1.0.0

## In both

*   checking whether package ‘annovarR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘.../revdep/checks.noindex/annovarR/new/annovarR.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘org.Hs.eg.db’
    ```

## Installation

### Devel

```
* installing *source* package ‘annovarR’ ...
** package ‘annovarR’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘annovarR’
* removing ‘.../revdep/checks.noindex/annovarR/new/annovarR.Rcheck/annovarR’

```
### CRAN

```
* installing *source* package ‘annovarR’ ...
** package ‘annovarR’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘annovarR’
* removing ‘.../revdep/checks.noindex/annovarR/old/annovarR.Rcheck/annovarR’

```
# anomalize

Version: 0.1.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 15-24 (anomalize_methods.Rmd) 
    Error: processing vignette 'anomalize_methods.Rmd' failed with diagnostics:
    there is no package called 'devtools'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        help   4.7Mb
    ```

# areal

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lwgeom’ ‘tibble’
      All declared Imports should be used.
    ```

# available

Version: 1.0.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# bcmaps

Version: 0.18.0

## In both

*   checking whether package ‘bcmaps’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘sf’ was built under R version 3.5.2
    See ‘.../revdep/checks.noindex/bcmaps/new/bcmaps.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘bcmapsdata’ ‘rgdal’
    ```

# blorr

Version: 0.2.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘lmtest’
    ```

# bsplus

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# CDECRetrieve

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lazyeval’ ‘purrr’ ‘roxygen2’
      All declared Imports should be used.
    ```

# cimir

Version: 0.1-0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# circumplex

Version: 0.2.1

## In both

*   checking whether package ‘circumplex’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘.../revdep/checks.noindex/circumplex/new/circumplex.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘circumplex’ ...
** package ‘circumplex’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/circumplex/Rcpp/include" -I".../revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/circumplex/Rcpp/include" -I".../revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c circular.cpp -o circular.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/circumplex/Rcpp/include" -I".../revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c parameters.cpp -o parameters.o
clang: [0;1;31merror: [0munsupported option '-fopenmp'[0m
clang: [0;1;31merror: make: [0m*** [parameters.o] Error 1unsupported option '-fopenmp'
[0m
make: *** Waiting for unfinished jobs....
clang: [0;1;31merror: [0munsupported option '-fopenmp'[0m
make: *** [circular.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘.../revdep/checks.noindex/circumplex/new/circumplex.Rcheck/circumplex’

```
### CRAN

```
* installing *source* package ‘circumplex’ ...
** package ‘circumplex’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/circumplex/Rcpp/include" -I".../revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/circumplex/Rcpp/include" -I".../revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c circular.cpp -o circular.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/circumplex/Rcpp/include" -I".../revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c parameters.cpp -o parameters.o
clang: [0;1;31merror: [0munsupported option '-fopenmp'[0m
make: *** [circular.o] Error 1
make: *** Waiting for unfinished jobs....
clang: [0;1;31merror: [0munsupported option '-fopenmp'[0m
clang: [0;1;31merror: [0munsupported option '-fopenmp'[0m
make: *** [parameters.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘.../revdep/checks.noindex/circumplex/old/circumplex.Rcheck/circumplex’

```
# codebook

Version: 0.8.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘jsonlite’ ‘pander’ ‘rlang’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘mice’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# compboost

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘checkmate’ ‘methods’
      All declared Imports should be used.
    ```

# configr

Version: 0.3.4

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘config’
    ```

# congressbr

Version: 0.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# CrossClustering

Version: 4.0.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘glue’
      All declared Imports should be used.
    ```

# DEScan2

Version: 1.2.1

## In both

*   checking whether package ‘DEScan2’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘.../revdep/checks.noindex/DEScan2/new/DEScan2.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘DEScan2’ ...
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/DEScan2/Rcpp/include" -I".../revdep/library.noindex/DEScan2/RcppArmadillo/include" -I/usr/local/include   -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/DEScan2/Rcpp/include" -I".../revdep/library.noindex/DEScan2/RcppArmadillo/include" -I/usr/local/include   -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c rcpparma_max_win.cpp -o rcpparma_max_win.o
clang++ -std=gnu++11 -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o DEScan2.so RcppExports.o rcpparma_max_win.o -L/Library/Frameworks/R.framework/Resources/lib -lRlapack -L/Library/Frameworks/R.framework/Resources/lib -lRblas -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: warning: directory not found for option '-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0'
ld: warning: directory not found for option '-L/usr/local/gfortran/lib'
installing to .../revdep/checks.noindex/DEScan2/new/DEScan2.Rcheck/DEScan2/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘GO.db’
ERROR: lazy loading failed for package ‘DEScan2’
* removing ‘.../revdep/checks.noindex/DEScan2/new/DEScan2.Rcheck/DEScan2’

```
### CRAN

```
* installing *source* package ‘DEScan2’ ...
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/DEScan2/Rcpp/include" -I".../revdep/library.noindex/DEScan2/RcppArmadillo/include" -I/usr/local/include   -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I".../revdep/library.noindex/DEScan2/Rcpp/include" -I".../revdep/library.noindex/DEScan2/RcppArmadillo/include" -I/usr/local/include   -fPIC  -g -O0 -Wall -pedantic -fdiagnostics-color=always -Wsign-compare -c rcpparma_max_win.cpp -o rcpparma_max_win.o
clang++ -std=gnu++11 -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o DEScan2.so RcppExports.o rcpparma_max_win.o -L/Library/Frameworks/R.framework/Resources/lib -lRlapack -L/Library/Frameworks/R.framework/Resources/lib -lRblas -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: warning: directory not found for option '-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0'
ld: warning: directory not found for option '-L/usr/local/gfortran/lib'
installing to .../revdep/checks.noindex/DEScan2/old/DEScan2.Rcheck/DEScan2/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘GO.db’
ERROR: lazy loading failed for package ‘DEScan2’
* removing ‘.../revdep/checks.noindex/DEScan2/old/DEScan2.Rcheck/DEScan2’

```
# detrendr

Version: 0.6.0

## In both

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# DiagrammeR

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        R             3.0Mb
        htmlwidgets   3.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# DirectEffects

Version: 0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘sandwich’
      All declared Imports should be used.
    ```

# dplyr

Version: 0.8.0.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.8Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
        libs   3.0Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘vctrs’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# dynutils

Version: 1.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# febr

Version: 1.0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rgdal’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
    ```

# ggpubr

Version: 0.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggstatsplot

Version: 0.0.9

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        help   4.1Mb
    ```

# ggthemes

Version: 4.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# huxtable

Version: 4.4.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Fontconfig warning: ".../revdep/library.noindex/huxtable/magick/etc/fonts/conf.d/90-synthetic.conf", line 5: unknown element "its:translateRule"
      Fontconfig error: ".../revdep/library.noindex/huxtable/magick/etc/fonts/conf.d/90-synthetic.conf", line 5: invalid attribute 'translate'
      Fontconfig error: ".../revdep/library.noindex/huxtable/magick/etc/fonts/conf.d/90-synthetic.conf", line 5: invalid attribute 'selector'
      Fontconfig error: ".../revdep/library.noindex/huxtable/magick/etc/fonts/conf.d/90-synthetic.conf", line 6: invalid attribute 'xmlns:its'
      Fontconfig error: ".../revdep/library.noindex/huxtable/magick/etc/fonts/conf.d/90-synthetic.conf", line 6: invalid attribute 'version'
      Fontconfig error: Cannot load default config file
      ── 1. Failure: huxreg copes with different models (@test-huxreg.R#31)  ─────────
      `hr <- huxreg(lm1, lm2, glm1)` produced warnings.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 889 SKIPPED: 57 FAILED: 1
      1. Failure: huxreg copes with different models (@test-huxreg.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        R     2.1Mb
        doc   2.9Mb
    ```

# infer

Version: 0.4.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# interactions

Version: 1.0.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘quantreg’, ‘effects’, ‘Hmisc’, ‘rockchalk’, ‘pequod’
    ```

# kableExtra

Version: 1.0.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Warning: package 'dplyr' was built under R version 3.5.2
    
    Attaching package: 'dplyr'
    
    The following object is masked from 'package:kableExtra':
    
        group_rows
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 327-331 (awesome_table_in_html.Rmd) 
    Error: processing vignette 'awesome_table_in_html.Rmd' failed with diagnostics:
    unused arguments ("Group 1", 4, 7)
    Execution halted
    ```

# kokudosuuchi

Version: 0.4.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52458 marked UTF-8 strings
    ```

# lgr

Version: 0.1.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 1. Failure: multisession: Logging works (@test_parallel.R#43)  ──────────────
      readLines\(tf\)\[\[5\]\] does not match "child.*flapply 1".
      Actual value: "INFO  \[2019-03-11 15:06:36\.822\] child flapply 2"
      
      ── 2. Failure: multisession: Logging works (@test_parallel.R#44)  ──────────────
      readLines\(tf\)\[\[6\]\] does not match "child.*flapply 2".
      Actual value: "INFO  \[2019-03-11 15:06:36\.831\] child flapply 1"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 420 SKIPPED: 6 FAILED: 2
      1. Failure: multisession: Logging works (@test_parallel.R#43) 
      2. Failure: multisession: Logging works (@test_parallel.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# lidR

Version: 2.0.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# logger

Version: 0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    
    Packages which this enhances but not available for checking:
      ‘logging’ ‘futile.logger’ ‘log4r’
    ```

# mosaic

Version: 1.5.0

## In both

*   checking whether package ‘mosaic’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
      Warning: package ‘ggformula’ was built under R version 3.5.2
      Warning: package ‘Matrix’ was built under R version 3.5.2
    See ‘.../revdep/checks.noindex/mosaic/new/mosaic.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘manipulate’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        R     4.3Mb
        doc   1.8Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘cubature’
    ```

# multicolor

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘cowsay’
      All declared Imports should be used.
    ```

# nandb

Version: 2.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘stats’
      All declared Imports should be used.
    ```

# neo4r

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘igraph’ ‘rlang’ ‘tidyselect’
      All declared Imports should be used.
    ```

# parsnip

Version: 0.0.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: abort("All arguments must be named")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 528 SKIPPED: 71 FAILED: 8
      1. Failure: spark execution (@test_boost_tree_spark.R#153) 
      2. Failure: spark execution (@test_boost_tree_spark.R#158) 
      3. Failure: spark execution (@test_boost_tree_spark.R#163) 
      4. Failure: spark execution (@test_boost_tree_spark.R#168) 
      5. Error: spark execution (@test_boost_tree_spark.R#173) 
      6. Error: spark execution (@test_logistic_reg_spark.R#80) 
      7. Error: spark execution (@test_multinom_reg_spark.R#69) 
      8. Error: spark execution (@test_rand_forest_spark.R#173) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pathlibr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘glue’ ‘logging’ ‘purrr’
      All declared Imports should be used.
    ```

# pkgcache

Version: 1.0.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1: read_packages_file(pf[1], mirror = "m1", repodir = "r1", platform = "source", rversion = "*") at testthat/test-packages-gz.R:88
      2: as_tibble(read.dcf.gz(path)) at .../revdep/checks.noindex/pkgcache/new/pkgcache.Rcheck/00_pkg_src/pkgcache/R/packages-gz.R:19
      3: read.dcf.gz(path) at .../revdep/checks.noindex/pkgcache/new/pkgcache.Rcheck/00_pkg_src/pkgcache/R/packages-gz.R:19
      4: gzfile(x, open = "r") at .../revdep/checks.noindex/pkgcache/new/pkgcache.Rcheck/00_pkg_src/pkgcache/R/utils.R:32
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 282 SKIPPED: 25 FAILED: 5
      1. Error: load_primary_pkgs (@test-metadata-cache.R#177) 
      2. Error: update_replica_rds (@test-metadata-cache.R#236) 
      3. Error: read_packages_file (@test-packages-gz.R#63) 
      4. Error: packages_parse_deps (@test-packages-gz.R#71) 
      5. Error: merge_packages_data (@test-packages-gz.R#88) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pmatch

Version: 0.1.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(pmatch)
      > 
      > test_check("pmatch")
      ── 1. Failure: we can transform a function that contains a call to cases (@test-
      tailr::can_loop_transform(llength) isn't true.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 109 SKIPPED: 0 FAILED: 1
      1. Failure: we can transform a function that contains a call to cases (@test-transforms.R#62) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# radiant.data

Version: 0.9.9

## In both

*   checking whether package ‘radiant.data’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘tidyr’ was built under R version 3.5.2
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘.../revdep/checks.noindex/radiant.data/new/radiant.data.Rcheck/00install.out’ for details.
    ```

# rbin

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# rfbCNPJ

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 27 marked UTF-8 strings
    ```

# RGMQL

Version: 1.2.0

## In both

*   checking whether package ‘RGMQL’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘.../revdep/checks.noindex/RGMQL/new/RGMQL.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘RGMQL’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '.../revdep/library.noindex/RGMQL/rJava/libs/rJava.so':
  dlopen(.../revdep/library.noindex/RGMQL/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: .../revdep/library.noindex/RGMQL/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘RGMQL’
* removing ‘.../revdep/checks.noindex/RGMQL/new/RGMQL.Rcheck/RGMQL’

```
### CRAN

```
* installing *source* package ‘RGMQL’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '.../revdep/library.noindex/RGMQL/rJava/libs/rJava.so':
  dlopen(.../revdep/library.noindex/RGMQL/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: .../revdep/library.noindex/RGMQL/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘RGMQL’
* removing ‘.../revdep/checks.noindex/RGMQL/old/RGMQL.Rcheck/RGMQL’

```
# riingo

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rlang’
      All declared Imports should be used.
    ```

# RTest

Version: 1.2.3

## In both

*   checking whether package ‘RTest’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘XML’ was built under R version 3.5.2
    See ‘.../revdep/checks.noindex/RTest/new/RTest.Rcheck/00install.out’ for details.
    ```

# scPipe

Version: 1.4.1

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘org.Hs.eg.db’ ‘org.Mm.eg.db’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# strex

Version: 0.1.3

## In both

*   checking whether package ‘strex’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘stringr’ was built under R version 3.5.2
    See ‘.../revdep/checks.noindex/strex/new/strex.Rcheck/00install.out’ for details.
    ```

# stringr

Version: 1.4.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 3 marked UTF-8 strings
    ```

# textclean

Version: 0.9.3

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

Version: 0.8.3

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 23 marked UTF-8 strings
    ```

# vdiffr

Version: 0.3.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# workflowr

Version: 1.2.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 837 SKIPPED: 116 FAILED: 10
      1.  Failure: authenticate_git can create HTTPS credentials (@test-wflow_git_push_pull.R#144) 
      2.  Failure: authenticate_git can create HTTPS credentials (@test-wflow_git_push_pull.R#145) 
      3.  Failure: authenticate_git can create HTTPS credentials (@test-wflow_git_push_pull.R#146) 
      4.  Failure: wflow_git_remote can add a remote. (@test-wflow_git_remote.R#54) 
      5.  Failure: wflow_git_remote can add a second remote. (@test-wflow_git_remote.R#61) 
      6.  Failure: wflow_use_github automates local GitHub configuration (@test-wflow_use_github.R#32) 
      7.  Failure: wflow_use_github can be used post GitLab (@test-wflow_use_github.R#74) 
      8.  Failure: wflow_use_github can be run twice (@test-wflow_use_github.R#176) 
      9.  Failure: wflow_use_github can be run after wflow_git_remote (@test-wflow_use_github.R#192) 
      10. Failure: wflow_use_github can be run after using GitLab remote (@test-wflow_use_github.R#210) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# XKCDdata

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

