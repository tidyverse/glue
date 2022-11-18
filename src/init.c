#include <R.h>
#include <R_ext/Rdynload.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL

// Compile with `C_VISIBILITY = -fvisibility=hidden` if you link to
// this library
#include <R_ext/Visibility.h>
#define export attribute_visible extern

/* .Call calls */
extern SEXP glue_(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP trim_(SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"glue_", (DL_FUNC)&glue_, 6},
    {"trim_", (DL_FUNC)&trim_, 1},
    {NULL, NULL, 0}};

export
void R_init_glue(DllInfo* dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
