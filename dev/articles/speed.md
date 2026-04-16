# Speed of glue

``` r
library(glue)
library(ggplot2)
library(bench)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

Glue is advertised as

> Fast, dependency free string literals

So what do we mean when we say that glue is fast? This does not mean
glue is the fastest thing to use in all cases, however for the features
it provides we can confidently say it is fast.

A good way to determine this is to compare its speed of execution to
some alternatives.

- [`base::paste0()`](https://rdrr.io/r/base/paste.html),
  [`base::sprintf()`](https://rdrr.io/r/base/sprintf.html): Functions in
  base R implemented in C that provide variable insertion (but not
  interpolation).
- [`R.utils::gstring()`](https://henrikbengtsson.github.io/R.utils/reference/gstring.html):
  Provides a similar interface as glue, but uses `${}` to delimit blocks
  to interpolate.
- `pystr::pystr_format()`[¹](#fn1),
  [`rprintf::rprintf()`](https://rdrr.io/pkg/rprintf/man/rprintf.html):
  Provide an interface similar to python string formatters with variable
  replacement, but not arbitrary interpolation.

Note:
[`stringr::str_interp()`](https://stringr.tidyverse.org/reference/str_interp.html)
was previously included in this benchmark, but is now formally marked as
“superseded”, in favor of
[`stringr::str_glue()`](https://stringr.tidyverse.org/reference/str_glue.html),
which just calls
[`glue::glue()`](https://glue.tidyverse.org/dev/reference/glue.md).

## Simple concatenation

``` r
bar <- "baz"

simple <- bench::mark(
  glue       = as.character(glue::glue("foo{bar}")),
  gstring    = R.utils::gstring("foo${bar}"),
  paste0     = paste0("foo", bar),
  sprintf    = sprintf("foo%s", bar),
  rprintf    = rprintf::rprintf("foo$bar", bar = bar)
)

simple %>%
  select(expression:total_time) %>%
  arrange(median)
#> # A tibble: 5 × 6
#>   expression      min   median `itr/sec` mem_alloc `gc/sec`
#>   <bch:expr> <bch:tm> <bch:tm>     <dbl> <bch:byt>    <dbl>
#> 1 sprintf    635.98ns 652.97ns  1329397.        0B     0   
#> 2 paste0       1.35µs   1.45µs   629953.        0B     0   
#> 3 glue        74.43µs  82.28µs    11833.  141.72KB    10.3 
#> 4 gstring     182.4µs 196.61µs     4975.    2.43MB     6.15
#> 5 rprintf    236.81µs 249.78µs     3931.  504.06KB     4.05

# plotting function defined in a hidden chunk
plot_comparison(simple)
```

![](speed_files/figure-html/unnamed-chunk-2-1.png)

While [`glue()`](https://glue.tidyverse.org/dev/reference/glue.md) is
slower than `paste0` and
[`sprintf()`](https://rdrr.io/r/base/sprintf.html), it is twice as fast
as `gstring()`, and `rprintf()`.

Although [`paste0()`](https://rdrr.io/r/base/paste.html) and
[`sprintf()`](https://rdrr.io/r/base/sprintf.html) don’t do string
interpolation and will likely always be significantly faster than glue,
glue was never meant to be a direct replacement for them.

[`rprintf::rprintf()`](https://rdrr.io/pkg/rprintf/man/rprintf.html)
does only variable interpolation, not arbitrary expressions, which was
one of the explicit goals of writing glue.

So glue is ~2x as fast as the function (`gstring()`), which has roughly
equivalent functionality.

It also is still quite fast, with over 8000 evaluations per second on
this machine.

## Vectorized performance

Taking advantage of glue’s vectorization is the best way to improve
performance. In a vectorized form of the previous benchmark, glue’s
performance is much closer to that of
[`paste0()`](https://rdrr.io/r/base/paste.html) and
[`sprintf()`](https://rdrr.io/r/base/sprintf.html).

``` r
bar <- rep("bar", 1e5)

vectorized <- bench::mark(
  glue    = as.character(glue::glue("foo{bar}")),
  gstring = R.utils::gstring("foo${bar}"),
  paste0  = paste0("foo", bar),
  sprintf = sprintf("foo%s", bar),
  rprintf = rprintf::rprintf("foo$bar", bar = bar)
)

vectorized %>%
  select(expression:total_time) %>%
  arrange(median)
#> # A tibble: 5 × 6
#>   expression      min   median `itr/sec` mem_alloc `gc/sec`
#>   <bch:expr> <bch:tm> <bch:tm>     <dbl> <bch:byt>    <dbl>
#> 1 sprintf      8.87ms   9.04ms     110.    781.3KB     4.16
#> 2 paste0       9.04ms   9.17ms     109.    781.3KB     4.19
#> 3 gstring     11.78ms  11.96ms      83.5    1.53MB     4.18
#> 4 glue        12.51ms  12.71ms      78.6    2.29MB     9.53
#> 5 rprintf     29.35ms  29.65ms      33.5    3.05MB     2.10

# plotting function defined in a hidden chunk
plot_comparison(vectorized)
```

![](speed_files/figure-html/unnamed-chunk-3-1.png)

------------------------------------------------------------------------

1.  pystr is no longer available from CRAN due to failure to correct
    installation errors and was therefore removed from further testing.
