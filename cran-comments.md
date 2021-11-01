This release fixes failures related to vctrs 0.3.0

## Test environments
* local OS X install, R 4.0.0
* ubuntu 16.04 (on GitHub Actions), R-release, R-devel
* Rhub

## R CMD check results

0 errors | 0 warnings | 0 note

## revdepcheck results

We checked 416 reverse dependencies (413 from CRAN + 3 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 2 new problems
 * We failed to check 3 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* crosstable - this seems like a false positive to me

* isoreader - PR sent to fix this issue https://github.com/isoverse/isoreader/pull/171

### Failed to check

* apisensr (NA)
* CB2      (NA)
* multinma (NA)
