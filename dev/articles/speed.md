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

simple |>
  select(expression:total_time) |>
  arrange(median)
#> # A tibble: 5 × 6
#>   expression      min   median `itr/sec` mem_alloc `gc/sec`
#>   <bch:expr> <bch:tm> <bch:tm>     <dbl> <bch:byt>    <dbl>
#> 1 sprintf       751ns 801.05ns  1164863.        0B     0   
#> 2 paste0        1.4µs   1.54µs   607350.        0B     0   
#> 3 glue         94.2µs  100.4µs     9521.  141.73KB    10.4 
#> 4 gstring     222.2µs 235.28µs     4140.    2.46MB     6.11
#> 5 rprintf     276.4µs 288.44µs     3394.  504.02KB     4.05

# plotting function defined in a hidden chunk
plot_comparison(simple)
```

![Beeswarm plot comparing execution times of simple string concatenation
across glue, gstring, paste0, sprintf, and rprintf. sprintf and paste0
are fastest, followed by glue, then gstring and
rprintf.](speed_files/figure-html/unnamed-chunk-2-1.png)

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

vectorized |>
  select(expression:total_time) |>
  arrange(median)
#> # A tibble: 5 × 6
#>   expression      min   median `itr/sec` mem_alloc `gc/sec`
#>   <bch:expr> <bch:tm> <bch:tm>     <dbl> <bch:byt>    <dbl>
#> 1 paste0       8.35ms   8.38ms     119.    781.3KB     2.05
#> 2 sprintf      8.38ms    8.4ms     119.    781.3KB     4.16
#> 3 gstring     11.36ms  11.45ms      87.1    1.53MB     4.15
#> 4 glue        12.53ms  12.94ms      76.8    2.29MB     8.53
#> 5 rprintf     27.47ms  27.59ms      36.0    3.05MB     4.50

# plotting function defined in a hidden chunk
plot_comparison(vectorized)
```

![Beeswarm plot comparing execution times of vectorized string
concatenation across glue, gstring, paste0, sprintf, and rprintf. The
order is paste0, sprintf, gstring, glue, rprintf. glue's performance is
very similar to gstring and rprintf is noticeably less performant than
the rest.](speed_files/figure-html/unnamed-chunk-3-1.png)

------------------------------------------------------------------------

1.  pystr is no longer available from CRAN due to failure to correct
    installation errors and was therefore removed from further testing.
