#include <stdlib.h>
#include <string.h>
#include "Rinternals.h"

SEXP set(SEXP x, int i, SEXP val) {
  if (i >= Rf_length(x)) {
    x = Rf_lengthgets(x, i + 1);
  }
  SET_VECTOR_ELT(x, i, val);
  return x;
}

SEXP fstring_(SEXP x, SEXP f) {
 typedef enum {
    text,
    escape,
    single_quote,
    double_quote,
    backtick,
    brace,
    comment
  } states;

  const char* xx = CHAR(STRING_ELT(x, 0));
  size_t str_len = LENGTH(STRING_ELT(x, 0)) + 1;

  char * str = (char *) malloc(str_len);

  SEXP out = PROTECT(Rf_allocVector(VECSXP, 1));

  size_t j = 0;
  size_t k = 0;
  int brace_level = 0;
  size_t start = 0;
  states state = text;
  states prev_state = text;
  for(size_t i = 0;i < str_len - 1;++i) {
    switch(state) {
      case text: {
        if (xx[i] == '{') {
          if (i + 1 < str_len && xx[i + 1] == '{') {
            ++i;
          } else {
            state = brace;
            brace_level = 1;
            start = i + 1;
            break;
          }
        }
        if (xx[i] == '}' && i + 1 < str_len && xx[i + 1] == '}') {
          ++i;
        }

        str[j++] = xx[i];
        break;
      }
      case escape: { state = prev_state; break; }
      case single_quote: {
        if (xx[i] == '\\') {
          prev_state = single_quote;
          state = escape;
        } else if (xx[i] == '\'') {
          state = brace;
        }
        break;
      }
      case double_quote: {
        if (xx[i] == '\\') {
          prev_state = double_quote;
          state = escape;
        } else if (xx[i] == '\"') {
          state = brace;
        }
        break;
      }
      case backtick: {
        if (xx[i] == '\\') {
          prev_state = backtick;
          state = escape;
        } else if (xx[i] == '`') {
          state = brace;
        }
        break;
      }
      case comment: {
        if (xx[i] == '\n') {
          state = brace;
        }
        break;
      }
      case brace: {
        switch (xx[i]) {
          case '{': {
            ++brace_level;
            break;
          }
          case '}': --brace_level; break;
          case '\'': state = single_quote; break;
          case '"': state = double_quote; break;
          case '`': state = backtick; break;
          case '#': state = comment; break;
        };
        if (brace_level == 0) {
          SEXP expr = PROTECT(Rf_ScalarString(Rf_mkCharLen(&xx[start], i - start)));
          SEXP call = PROTECT(Rf_lang2(f, expr));
          SEXP result = PROTECT(Rf_eval(call, R_GlobalEnv));

          str[j] = '\0';
          out = set(out, k++, Rf_mkString(str));
          out = set(out, k++, result);

          // Clear the string buffer
          memset(str, 0, j);
          j = 0;
          UNPROTECT(3);
          state = text;
        }
        break;
      }
    };

  }

  if (j > 0) {
    str[j] = '\0';
    out = set(out, k++, Rf_mkString(str));
  }

  if (state == brace) {
    Rf_error("Expecting '}'");
  }

  free(str);

  UNPROTECT(1);
  return out;
}
