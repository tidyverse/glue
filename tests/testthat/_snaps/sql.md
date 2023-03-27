# get nice errors if rlang installed

    Code
      glue_sql("{x + }")
    Error <rlang_error>
      Failed to parse glue component
      Caused by error in `parse()`:
      ! <text>:2:0: unexpected end of input
      1: x + 
         ^
    Code
      glue_sql("{NOTFOUND}")
    Error <rlang_error>
      Failed to evaluate glue component {NOTFOUND}
      Caused by error:
      ! object 'NOTFOUND' not found

