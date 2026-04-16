# glue errors if the expression fails

    Code
      glue("{NoTfOuNd}")
    Condition
      Error:
      ! Failed to evaluate glue component {NoTfOuNd}
      Caused by error:
      ! object 'NoTfOuNd' not found

# glue errors if invalid format

    Code
      glue("x={x")
    Condition
      Error in `glue_data()`:
      ! Expecting '}'

# error if non length 1 inputs

    Code
      glue(1:2, "{1:2}")
    Condition
      Error:
      ! All unnamed arguments must be length 1

# error if not simple recycling

    Code
      glue("{1:2}{1:10}")
    Condition
      Error:
      ! Variables must be length 1 or 10

# throws informative error if interpolating a function

    Code
      glue("{cat}")
    Condition
      Error:
      ! glue cannot interpolate functions into strings.
      * object 'cat' is a function.

# `+` method requires character vectors

    Code
      as_glue("a") + 1
    Condition
      Error in `+.glue`:
      ! RHS must be a character vector.
    Code
      1 + as_glue("a")
    Condition
      Error in `+.glue`:
      ! LHS must be a character vector.

# `+` method errors for inputs of incompatible size

    Code
      as_glue(letters[1:2]) + letters[1:3]
    Condition
      Error:
      ! Variables must be length 1 or 3

# unterminated quotes are error

    Code
      glue("{this doesn\"t work}")
    Condition
      Error in `glue_data()`:
      ! Unterminated quote (")

---

    Code
      glue("{this doesn't work}")
    Condition
      Error in `glue_data()`:
      ! Unterminated quote (')

---

    Code
      glue("{this doesn`t work}")
    Condition
      Error in `glue_data()`:
      ! Unterminated quote (`)

# unterminated comment

    Code
      glue("pre {1 + 5 # comment} post")
    Condition
      Error in `glue_data()`:
      ! A '#' comment in a glue expression must terminate with a newline.

---

    Code
      glue("pre {1 + 5 # comment")
    Condition
      Error in `glue_data()`:
      ! A '#' comment in a glue expression must terminate with a newline.

# `.literal` treats quotes and `#` as regular characters

    Code
      glue("{'fo`o\"#}", .transformer = function(x, ...) x)
    Condition
      Error in `glue_data()`:
      ! Unterminated quote (')

