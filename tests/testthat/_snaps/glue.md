# glue has useful print method

    Code
      x <- c("abc", "def\nghi", "\"\\", NA)
      glue("{x}", .na = NULL)
    Output
      [1] | abc
      [2] | def
          | ghi
      [3] | "\
      [4] | NA

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

