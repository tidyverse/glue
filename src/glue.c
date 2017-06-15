#include <stdlib.h>
#include <string.h>
#include "Rinternals.h"

SEXP set(SEXP x, PROTECT_INDEX x_idx, int i, SEXP val) {
  if (i >= Rf_length(x)) {
    x = Rf_lengthgets(x, i + 1);
    REPROTECT(x, x_idx);
  }
  SET_VECTOR_ELT(x, i, val);
  return x;
}

SEXP glue_(SEXP x, SEXP f, SEXP open_arg, SEXP close_arg) {
  typedef enum {
    text,
    escape,
    single_quote,
    double_quote,
    backtick,
    delim,
    comment
  } states;

  const char* xx = Rf_translateCharUTF8(STRING_ELT(x, 0));
  size_t str_len = strlen(xx);

  char* str = (char*)malloc(str_len + 1);

  const char* open = CHAR(STRING_ELT(open_arg, 0));
  size_t open_len = strlen(open);

  const char* close = CHAR(STRING_ELT(close_arg, 0));
  size_t close_len = strlen(close);

  SEXP out = Rf_allocVector(VECSXP, 1);
  PROTECT_INDEX out_idx;
  PROTECT_WITH_INDEX(out, &out_idx);

  size_t j = 0;
  size_t k = 0;
  int delim_level = 0;
  size_t start = 0;
  states state = text;
  states prev_state = text;
  for (size_t i = 0; i < str_len; ++i) {
    switch (state) {
      case text: {
        if (strncmp(&xx[i], open, open_len) == 0) {
          /* check for open delim doubled */
          if (strncmp(&xx[i + open_len], open, open_len) == 0) {
            i += open_len;
          } else {
            state = delim;
            delim_level = 1;
            start = i + open_len;
            break;
          }
        }
        if (strncmp(&xx[i], close, close_len) == 0 &&
            strncmp(&xx[i + close_len], close, close_len) == 0) {
          i += close_len;
        }

        str[j++] = xx[i];
        break;
      }
      case escape: {
        state = prev_state;
        break;
      }
      case single_quote: {
        if (xx[i] == '\\') {
          prev_state = single_quote;
          state = escape;
        } else if (xx[i] == '\'') {
          state = delim;
        }
        break;
      }
      case double_quote: {
        if (xx[i] == '\\') {
          prev_state = double_quote;
          state = escape;
        } else if (xx[i] == '\"') {
          state = delim;
        }
        break;
      }
      case backtick: {
        if (xx[i] == '\\') {
          prev_state = backtick;
          state = escape;
        } else if (xx[i] == '`') {
          state = delim;
        }
        break;
      }
      case comment: {
        if (xx[i] == '\n') {
          state = delim;
        }
        break;
      }
      case delim: {
        if (strncmp(&xx[i], open, open_len) == 0) {
          ++delim_level;
          i += open_len - 1;
        } else if (strncmp(&xx[i], close, close_len) == 0) {
          --delim_level;
          i += close_len - 1;
        } else {
          switch (xx[i]) {
            case '\'':
              state = single_quote;
              break;
            case '"':
              state = double_quote;
              break;
            case '`':
              state = backtick;
              break;
            case '#':
              state = comment;
              break;
          };
        }
        if (delim_level == 0) {
          SEXP expr = PROTECT(Rf_ScalarString(
              Rf_mkCharLen(&xx[start], (i - close_len) + 1 - start)));
          SEXP call = PROTECT(Rf_lang2(f, expr));
          SEXP result = PROTECT(Rf_eval(call, R_GlobalEnv));

          str[j] = '\0';
          SEXP str_ = PROTECT(Rf_ScalarString(Rf_mkCharLenCE(str, j, CE_UTF8)));
          out = set(out, out_idx, k++, str_);
          out = set(out, out_idx, k++, result);

          // Clear the string buffer
          memset(str, 0, j);
          j = 0;
          UNPROTECT(4);
          state = text;

          /* Move i to end of closing delim, but it always moves by 1 */
          /*i += close_len - 1;*/
        }
        break;
      }
    };
  }

  str[j] = '\0';
  SEXP str_ = PROTECT(Rf_ScalarString(Rf_mkCharLenCE(str, j, CE_UTF8)));
  out = set(out, out_idx, k++, str_);

  if (state == delim) {
    Rf_error("Expecting '%s'", close);
  }

  free(str);

  UNPROTECT(2);
  return out;
}
