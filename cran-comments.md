This release fixes PROTECT errors uncovered by running with `gctorture()` and
also provides better support for unicode text. It should also fix the rchck
warnings from
https://raw.githubusercontent.com/kalibera/cran-checks/master/rchk/results/glue.out

## Test environments
* local OS X install, R 3.3.2
* ubuntu 12.04 (on travis-ci), R-release, R-devel
* Rhub

## R CMD check results

0 errors | 0 warnings | 1 note

* Possibly mis-spelled words in DESCRIPTION:
    Docstrings (6:89)
This is the proper spelling of the python term.

## Downstream dependencies
I ran `R CMD check` on all 4 reverse dependencies (https://github.com/tidyverse/glue/tree/master/revdep).

There were no issues found related to glue changes. The **dplyr** errors are
the same as those on CRAN, the **dbplyr** errors are due to an insufficient
dplyr version and are unrelated to glue changes as far as I can tell.
