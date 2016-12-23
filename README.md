# fstrings
[![Travis-CI Build Status](https://travis-ci.org/jimhester/fstrings.svg?branch=m
aster)](https://travis-ci.org/jimhester/fstrings)

Paython style [fstrings](https://www.python.org/dev/peps/pep-0498/) for R.

```r
name <- "Fred"
age <- 50
anniversary <- as.Date("1991-10-12")
f('My name is {name}, my age next year is {age + 1}, my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')
#> [1] "My name is Fred, my age next year is 51, my anniversary is Saturday, October 12, 1991."
```
