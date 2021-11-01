# crosstable

<details>

* Version: 0.2.2
* GitHub: https://github.com/DanChaltiel/crosstable
* Source code: https://github.com/cran/crosstable
* Date/Publication: 2021-10-19 11:50:02 UTC
* Number of recursive dependencies: 113

Run `cloud_details(, "crosstable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘crosstable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: body_add_legend
    > ### Title: Add a table legend to an 'officer' document
    > ### Aliases: body_add_legend body_add_table_legend body_add_figure_legend
    > 
    > ### ** Examples
    > 
    > library(officer)
    ...
    +                           name_format=fp_italic, legend_style="Balloon Text") %>%
    +     body_add_crosstable(crosstable(iris[2])) %>% 
    +     body_add_normal() %>%
    +     body_add_normal("There is also the figure \\@ref(iris_fig)") %>%
    +     body_add_gg(p) %>%
    +     body_add_figure_legend("Iris plot", bookmark="iris_fig")
    Error in if (str_detect(value, "\\\\@ref\\((.*?)\\)")) { : 
      argument is of length zero
    Calls: %>% ... body_add_legend -> body_add_fpar -> getOption -> body_add_normal
    Execution halted
    ```

# isoreader

<details>

* Version: 1.3.1
* GitHub: https://github.com/isoverse/isoreader
* Source code: https://github.com/cran/isoreader
* Date/Publication: 2021-10-15 20:20:02 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "isoreader")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... NOTE
    ```
    Missing or unexported object: ‘glue::collapse’
    ```

