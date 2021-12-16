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

