# glue_col() errors for invalid syntax or when color_fun can't be found

    Code
      glue_col("{%}")
    Condition
      Error in `parse()`:
      ! <text>:1:1: unexpected input
      1: %
          ^

---

    Code
      glue_col("{foo %}")
    Condition
      Error in `get()`:
      ! object 'foo' of mode 'function' was not found

---

    Code
      glue_col("{foo %}")
    Condition
      Error in `get()`:
      ! object 'foo' of mode 'function' was not found

# glue_col() can exploit the `.literal` argument

    Code
      glue_col("Colorless {green idea's} sleep furiously")
    Condition
      Error in `glue_data()`:
      ! Unterminated quote (')

---

    Code
      glue_col("Colorless {green idea\"s} sleep furiously")
    Condition
      Error in `glue_data()`:
      ! Unterminated quote (")

---

    Code
      glue_col("Colorless {green idea`s} sleep furiously")
    Condition
      Error in `glue_data()`:
      ! Unterminated quote (`)

---

    Code
      glue_col("Hey a URL: {blue https://example.com/#section}")
    Condition
      Error in `glue_data()`:
      ! A '#' comment in a glue expression must terminate with a newline.

