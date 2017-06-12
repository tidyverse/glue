# Setup

## Platform

|setting  |value                                       |
|:--------|:-------------------------------------------|
|version  |R version 3.4.0 Patched (2017-05-10 r72669) |
|system   |x86_64, darwin15.6.0                        |
|ui       |X11                                         |
|language |(EN)                                        |
|collate  |en_US.UTF-8                                 |
|tz       |America/New_York                            |
|date     |2017-06-12                                  |

## Packages

|package  |*  |version    |date       |source                    |
|:--------|:--|:----------|:----------|:-------------------------|
|covr     |   |2.2.2      |2017-01-05 |cran (@2.2.2)             |
|glue     |   |1.0.0.9000 |2017-06-12 |local (tidyverse/glue@NA) |
|magrittr |   |1.5        |2014-11-22 |cran (@1.5)               |
|testthat |   |1.0.2      |2016-04-23 |cran (@1.0.2)             |

# Check results

2 packages with problems

|package |version | errors| warnings| notes|
|:-------|:-------|------:|--------:|-----:|
|dbplyr  |1.0.0   |      1|        0|     0|
|dplyr   |0.7.0   |      1|        0|     2|

## dbplyr (1.0.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/tidyverse/dplyr/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required and available but unsuitable version: ‘dplyr’

Package suggested but not available for checking: ‘RPostgreSQL’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## dplyr (0.7.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/tidyverse/dplyr/issues

1 error  | 0 warnings | 2 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [12s/12s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  
  testthat results ================================================================
  OK: 2623 SKIPPED: 9 FAILED: 8
  1. Failure: row_number(), ntile(), min_rank(), percent_rank(), dense_rank(), and cume_dist() work (@test-hybrid.R#413) 
  2. Failure: desc is correctly handled by window functions (@test-mutate-windowed.R#9) 
  3. Failure: desc is correctly handled by window functions (@test-mutate-windowed.R#10) 
  4. Failure: row_number gives correct results (@test-mutate-windowed.R#17) 
  5. Failure: rank functions deal correctly with NA (#774) (@test-mutate-windowed.R#113) 
  6. Failure: rank functions deal correctly with NA (#774) (@test-mutate-windowed.R#120) 
  7. Failure: rank functions deal correctly with NA (#774) (@test-mutate-windowed.R#141) 
  8. Failure: rank functions deal correctly with NA (#774) (@test-mutate-windowed.R#148) 
  
  Error: testthat unit tests failed
  Execution halted

checking package dependencies ... NOTE
Packages suggested but not available for checking: ‘dbplyr’ ‘RPostgreSQL’

checking Rd cross-references ... NOTE
Packages unavailable to check Rd xrefs: ‘dbplyr’, ‘RPostgreSQL’
```

