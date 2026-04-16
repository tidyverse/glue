# glue and glue_data safe do not execute code

    Code
      glue_safe("{1+1}")
    Condition
      Error:
      ! object '1+1' not found

---

    Code
      glue_data_safe(mtcars, "{1+1}")
    Condition
      Error:
      ! object '1+1' not found

