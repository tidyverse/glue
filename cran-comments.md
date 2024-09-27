## revdepcheck results

We checked 803 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We see 9 problems
 * We failed to check 1 package

Issues with CRAN packages are summarised below.

### New problems

These failures come from glue becoming more strict about an argument and making its behaviour match the documentation.
All maintainers have been notified and, where possible, given patches.
I did one round of checks and notifications in December 2023 and another just before this release.

* adoptr: Notified and pull request made 2024-09-19
* atrrr: Notified and pull request made 2024-09-19
* codebook: Notified December 2023
* gtreg: Failing indirectly due to gtsummary (see next bullet)
* gtsummary: Notified 2024-09-19
* logger: Notified 2024-09-19
* roxytypes: Notified and pull request made 2024-09-19
* shinyCohortBuilder: Notified December 2023
* sqltargets: Notified and pull request made 2024-09-19

### Failed to check

* params           Loading failure. Notified December 2023
