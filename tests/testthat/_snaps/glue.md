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

