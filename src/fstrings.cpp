#include "Rcpp.h"

// [[Rcpp::export]]
std::string fstring_(std::string x, Rcpp::Function f) {
  enum states {
    text,
    escape,
    single_quote,
    double_quote,
    backtick,
    brace,
    comment
  };

  std::string out = x;
  int i = 0;
  int brace_level = 0;
  int start = 0;
  int diff = 0;
  states state = text;
  states prev_state = text;
  for(;i < x.size();++i) {
    switch(state) {
      case text: {
        if (x[i] == '{') {
          state = brace;
          brace_level = 1;
          start = i + 1;
        }
        break;
      }
      case escape: { state = prev_state; break; }
      case single_quote: {
        if (x[i] == '\\') {
          prev_state = single_quote;
          state = escape;
        } else if (x[i] == '\'') {
          state = brace;
        }
        break;
      }
      case double_quote: {
        if (x[i] == '\\') {
          prev_state = double_quote;
          state = escape;
        } else if (x[i] == '\"') {
          state = brace;
        }
        break;
      }
      case backtick: {
        if (x[i] == '\\') {
          prev_state = backtick;
          state = escape;
        } else if (x[i] == '`') {
          state = brace;
        }
        break;
      }
      case comment: {
        if (x[i] == '\n') {
          state = brace;
        }
        break;
      }
      case brace: {
        switch (x[i]) {
          case '{': {
            if (i > 0 && brace_level == 1 && x[i-1] == '{') {
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
          std::string expr = x.substr(start, i - start);
          std::string result = Rcpp::as<std::string>(f(expr));
          int begin = start - 1 - diff;
          int length = i - start + 2;
          //Rcpp::Rcout << result << "{" << begin << ':' << length << "}";
          out.replace(begin, length, result);
          diff += (expr.length() + 2) - result.length();
          state = text;
        }
        break;
      }
    };

  }

  return out;
}
