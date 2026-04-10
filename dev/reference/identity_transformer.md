# Parse and Evaluate R code

This is a simple wrapper around `eval(parse())`, used as the default
transformer.

## Usage

``` r
identity_transformer(text, envir = parent.frame())
```

## Arguments

- text:

  Text (typically) R code to parse and evaluate.

- envir:

  environment to evaluate the code in

## See also

[`vignette("transformers", "glue")`](https://glue.tidyverse.org/dev/articles/transformers.md)
for documentation on creating custom glue transformers and some common
use cases.
