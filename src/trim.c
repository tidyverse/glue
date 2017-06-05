#include <stdlib.h>
#include <stdbool.h>
#include "Rinternals.h"

SEXP trim_(SEXP x) {

  size_t len = LENGTH(x);

  SEXP out = PROTECT(Rf_allocVector(STRSXP, len));
  for (size_t num = 0; num < len;++num) {
    const char* xx = Rf_translateCharUTF8(STRING_ELT(x, num));
    size_t str_len = strlen(xx);
    if (str_len == 0) {
      SET_STRING_ELT(out, num, R_BlankString);
      continue;
    }

    char * str = (char *) malloc(str_len + 1);
    size_t start = 0;
    size_t i = 0;
    bool new_line = false;
    /* remove first blank line */
    while(i < str_len) {
      if (xx[i] == '\n') {
        ++i;
        start = i;
        new_line = true;
        break;
      } else if (xx[i] == ' ' || xx[i] == '\t') {
        ++i;
      } else {
        break;
      }
    }

    i = start;
    size_t indent = 0;

    /* Maximum size of size_t */
    size_t min_indent = (size_t)-1;

    /* find minimum indent */
    while(i < str_len) {
      if (xx[i] == '\n') {
        new_line = true;
      } else if (new_line) {
        if (xx[i] == ' ' || xx[i] == '\t') {
          ++indent;
        } else {
          if (indent < min_indent) {
            min_indent = indent;
          }
          new_line = false;
        }
      }
      ++i;
    }
    if (indent < min_indent) {
      min_indent = indent;
    }

    new_line = true;
    i = start;
    size_t j = 0;

    /* copy the string removing the minimum indent from new lines */
    while(i < str_len) {
      if (xx[i] == '\n') {
        new_line = true;
      } else if (xx[i] == '\\' && i + 1 < str_len && xx[i + 1] == '\n') {
        new_line = true;
        i+=2;
        continue;
      } else if (new_line) {
        if (i + min_indent < str_len && (xx[i] == ' ' || xx[i] == '\t')) {
          i += min_indent;
        }
        new_line = false;
      }
      str[j++] = xx[i++];
    }
    str[j] = '\0';

    /* Remove trailing whitespace up to the first newline */
    size_t end = j;
    while(j > 0) {
      if (str[j] == '\n') {
        end = j;
        break;
      } else if (str[j] == '\0' || str[j] == ' ' || str[j] == '\t') {
        --j;
      } else {
        break;
      }
    }
    str[end] = '\0';
    SET_STRING_ELT(out, num, Rf_mkCharCE(str, CE_UTF8));
    free(str);
  }

  UNPROTECT(1);
  return out;
}
