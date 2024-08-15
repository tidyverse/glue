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

