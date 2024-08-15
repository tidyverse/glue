# get nice errors if rlang installed

    Code
      glue_sql("{x + }")
    Condition
      Error:
      ! Failed to parse glue component
      Caused by error in `parse()`:
      ! <text>:2:0: unexpected end of input
      1: x + 
         ^
    Code
      glue_sql("{NOTFOUND}")
    Condition
      Error:
      ! Failed to evaluate glue component {NOTFOUND}
      Caused by error:
      ! object 'NOTFOUND' not found

