## Current state

Glue is currently stable, it is used and installed quite extensively and has relatively few issues reported.
Most issues reported tend to center around `glue_sql()`.

## Known outstanding issues

I think we need a way to optionally disable interpretation of quotes, which would fix both https://github.com/r-lib/cli/issues/370, and the long standing https://github.com/tidyverse/glue/issues/158

Possibly the loading and closing blank line behaviors could be tweaked, so that the issues brought up in https://github.com/tidyverse/glue/issues/234 are more natural.
It may be difficult to do this while maintaining backwards compatibility.

## Future directions

Should we include more built-in support for custom numeric formats, as suggested by https://github.com/tidyverse/glue/issues/87 and https://github.com/tidyverse/glue/issues/86?
For now I have avoided this, but it is a common pain point for glue

Potentially we could revisit the use of the custom glue class, which I gather also causes people grief in practice?
