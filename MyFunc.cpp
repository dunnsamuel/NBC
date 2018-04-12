// Source for MyFunc.cpp
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
CharacterVector myFunc(DataFrame x) {
  NumericVector col1 = as<NumericVector>(x["col1"]);
  NumericVector col2 = as<NumericVector>(x["col2"]);
  NumericVector col3 = as<NumericVector>(x["col3"]);
  NumericVector col4 = as<NumericVector>(x["col4"]);
  int n = col1.size();
  CharacterVector out(n);
  for (int i=0; i<n; i++) {
    double tempOut = col1[i] + col2[i] + col3[i] + col4[i];
    if (tempOut > 4){
      out[i] = "greater_than_4";
    } else {
      out[i] = "lesser_than_4";
    }
  }
  return out;
}