# get nice errors if rlang installed

    Code
      identity_transformer("x + ")
    Error <rlang_error>
      Failed to parse glue component
      Caused by error in `parse()`:
      ! <text>:2:0: unexpected end of input
      1: x + 
         ^
    Code
      identity_transformer("NOTFOUND")
    Error <rlang_error>
      Failed to evaluate glue component {NOTFOUND}
      Caused by error:
      ! argument "envir" is missing, with no default

