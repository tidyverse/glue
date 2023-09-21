# + method requires character vectors

    Code
      as_glue("a") + 1
    Error <simpleError>
      RHS must be a character vector.
    Code
      1 + as_glue("a")
    Error <simpleError>
      LHS must be a character vector.

# unterminated comment

    Code
      glue("pre {1 + 5 # comment} post")
    Error <simpleError>
      A '#' comment in a glue expression must terminate with a newline.

---

    Code
      glue("pre {1 + 5 # comment")
    Error <simpleError>
      A '#' comment in a glue expression must terminate with a newline.

# `.literal` treats quotes and `#` as regular characters

    Code
      glue("{'fo`o\"#}", .transformer = function(x, ...) x)
    Error <simpleError>
      Unterminated quote (')

