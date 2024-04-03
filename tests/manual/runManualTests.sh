#!/bin/bash

# Always run at least once
R -e 'Rcpp::compileAttributes(".",verbose=TRUE)';
# Should actually move needed header in inst/include/shinfluevidence.h insted of using echo
R CMD check ../shinfluevidence
R CMD INSTALL ../shinfluevidence

R -e 'library(testthat);library(shinfluevidence);test_dir("tests/manual/")'
