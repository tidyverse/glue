# glue_col() errors for invalid syntax or when color_fun can't be found

    Code
      glue_col("{%}")
    Error <simpleError>
      <text>:1:1: unexpected input
      1: %
          ^

---

    Code
      glue_col("{foo %}")
    Error <simpleError>
      object 'foo' of mode 'function' was not found

---

    Code
      glue_col("{foo %}")
    Error <simpleError>
      object 'foo' of mode 'function' was not found

# glue_col() can exploit the `.literal` argument

    Code
      glue_col("Colorless {green idea's} sleep furiously")
    Error <simpleError>
      Unterminated quote (')

---

    Code
      glue_col("Colorless {green idea\"s} sleep furiously")
    Error <simpleError>
      Unterminated quote (")

---

    Code
      glue_col("Colorless {green idea`s} sleep furiously")
    Error <simpleError>
      Unterminated quote (`)

---

    Code
      glue_col("Hey a URL: {blue https://example.com/#section}")
    Error <simpleError>
      Unterminated comment

