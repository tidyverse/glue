# glue_sql / errors if no connection given

    Code
      glue_sql("{var}")
    Condition
      Error in `glue_sql()`:
      ! `.con` is absent but must be supplied.

# glue_data_sql / errors if no connection given

    Code
      glue_data_sql(mtcars, "{head(gear)*}")
    Condition
      Error in `glue_data_sql()`:
      ! `.con` is absent but must be supplied.

# get nice errors if rlang installed

    Code
      glue_sql("{x + }", .con = con)
    Condition
      Error:
      ! Failed to parse glue component
      Caused by error in `parse()`:
      ! <text>:2:0: unexpected end of input
      1: x + 
         ^
    Code
      glue_sql("{NOTFOUND}", .con = con)
    Condition
      Error:
      ! Failed to evaluate glue component {NOTFOUND}
      Caused by error:
      ! object 'NOTFOUND' not found

