## revdepcheck results

We checked 463 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 1 new problem
 * We failed to check 0 packages

Issues with CRAN packages are summarised below.

### New problems

* iotables

  As of 2022-01-21, I see very similar failure for iotables on CRAN, on
  flavours r-release-windows-ix86+x86_64 and
  r-oldrel-windows-ix86+x86_64.
  I suspect that the iotables package makes live API calls in its vignettes and
  is subject to intermittent failure.
  I don't think this has anything to do with glue.

  checking re-building of vignette outputs ... WARNING

  Error(s) in re-building vignettes:
  --- re-building ‘environmental_impact.Rmd’ using rmarkdown
  ...
  Quitting from lines 105-106 (environmental_impact.Rmd) 
  Error: processing vignette 'environmental_impact.Rmd' failed with diagnostics:
  get_eurostat_raw fails with the id env_ac_ainah_r2
  --- failed re-building ‘environmental_impact.Rmd’
  ...
  SUMMARY: processing the following file failed:
    ‘environmental_impact.Rmd’
  Error: Vignette re-building failed.
