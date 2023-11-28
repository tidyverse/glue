# get nice errors if rlang installed

    Code
      identity_transformer("x + ")
    Condition
      Error:
      ! Failed to parse glue component
      Caused by error in `parse()`:
      ! <text>:2:0: unexpected end of input
      1: x + 
         ^
    Code
      identity_transformer("NOTFOUND")
    Condition
      Error:
      ! Failed to evaluate glue component {NOTFOUND}
      Caused by error:
      ! object 'NOTFOUND' not found

