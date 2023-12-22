## revdepcheck results

We checked 713 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * One package fails check intermittently, for reasons seemingly unrelated to glue
 * We failed to check 1 package

Issues with CRAN packages are summarised below.

### Problems

* diseasystore
  checking tests ... ERROR
  
This package fails check about half the time in our automated checks and it doesn't seem to have anything to do with the glue package. It looks like so:

Caused by error in `dplyr::db_write_table()`:
! Can't write table table `dbplyr_045`.
Caused by error:
! Invalid result set

### Failed to check

* TriDimRegression (NA)l

Fails because "there is no package called 'rstantools'"
