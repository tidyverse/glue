---
title: "Transformers"
author: "Jim Hester"
date: "2017-08-21"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Transformers}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

Transformers allow you to apply functions to the glue input and output, before
and after evaluation. This allows you to write things like `sql_glue()`, which
automatically quotes variables for you or add a syntax for automatically
collapsing outputs.


```r
con <- DBI::dbConnect(odbc::odbc(), "PostgreSQL")
glue_sql <- function(..., .con) {
  glue(..., .transformer = sql_quote_transformer(.con))
}

var <- "foo"
tbl <- "bar"
glue_sql("SELECT {var} FROM {tbl}", .con = con)
```

```
## SELECT 'foo' FROM 'bar'
```

Or a transformer which automatically collapses any glue block ending with `*`.


```r
glue("{1:5*}\n{letters[1:5]*}", .transformer = collapse_transformer(sep = ", "))
```

```
## 1, 2, 3, 4, 5
## a, b, c, d, e
```

```r
glue("{1:5*}\n{letters[1:5]*}", .transformer = collapse_transformer(sep = ", ", last = " and "))
```

```
## 1, 2, 3, 4 and 5
## a, b, c, d and e
```

Or a transformer which converts the text to the equivalent emoji.


```r
glue_ji <- function(...) {
  glue(..., .open = ":", .close = ":", .transformer = emoji_transformer)
}
glue_ji("one :heart:")
```

```
## one ❤️
```

```r
glue_ji("many :heart*:")
```

```
## many 😍😻💔💕💓💘❤️
```

Or a transformer which allows succinct sprintf format strings.

```r
glue_fmt <- function(...) {
  glue(..., .transformer = sprintf_transformer)
}
glue_fmt("π = {pi:.2}")
```

```
## π = 3.14
```

# TODO: readr::as_chunk_callback
