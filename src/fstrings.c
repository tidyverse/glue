#include <stdlib.h>
#include <string.h>
#include "Rinternals.h"

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
  size_t in_len = LENGTH(STRING_ELT(x, 0)) + 1;
  size_t out_len = in_len + 1024;

  char * out = (char *) malloc(out_len);

  size_t j = 0;
  int brace_level = 0;
  size_t start = 0;
  states state = text;
  states prev_state = text;
  for(size_t i = 0;i < in_len;++i) {
    switch(state) {
      case text: {
        if (xx[i] == '{') {
          state = brace;
          brace_level = 1;
          start = i + 1;
        } else {
          if (j + 1 >= out_len) {
            out_len *= 2;
            out = (char *) realloc(out, out_len);
          }
          out[j++] = xx[i];
        }
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
            if (i > 0 && brace_level == 1 && xx[i-1] == '{') {
              if (j + 2 >= out_len) {
                out_len *= 2;
                out = (char *) realloc(out, out_len);
              }
              out[j++] = '{'; out[j++] = '{';
              state = text; break;
            }
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
          size_t length = LENGTH(STRING_ELT(result, 0));
          if (j + length >= out_len) {
            out_len *= 2;
            out = (char *) realloc(out, out_len);
          }
          strncpy(&out[j], CHAR(STRING_ELT(result, 0)), length);
          j += length;
          UNPROTECT(3);
          state = text;
        }
        break;
      }
    };

  }

  SEXP out_ = Rf_mkString(out);
  free(out);

  return out_;
}
