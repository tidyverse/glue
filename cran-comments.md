## Test environments
* local OS X install, R 3.4.3
* ubuntu 12.04 (on travis-ci), R-release, R-devel
* Rhub

## R CMD check results

0 errors | 0 warnings | 0 note

## Downstream dependencies
I ran `R CMD check` on all 59 reverse dependencies (https://github.com/tidyverse/glue/tree/master/revdep).

There were 4 issues found due to deprecating a function. I have sent pull
requests with the necessary changes to all of the affected packages.

- https://github.com/radiant-rstats/radiant.data/pull/20
- https://github.com/ropenscilabs/available/commit/2a54276f8c1ebe3c77f907fecf90d626b181730a
- https://github.com/trinker/textclean/pull/40
- https://github.com/tidyverse/googledrive/pull/222
