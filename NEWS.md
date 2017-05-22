# glue 1.0.0.9000

`glue()` and `glue_data()` can now take alternative delimiters to `{` and `}`.
This is useful if you are writing to a format that uses a lot of braces, such
as LaTeX. (#23)

`collapse()` now returns 0 length output if given 0 length input (#28).

# glue 0.0.0.9000

* Fix `glue()` to admit `.` as an embedded expression in a string (#15, @egnha).

* Added a `NEWS.md` file to track changes to the package.
