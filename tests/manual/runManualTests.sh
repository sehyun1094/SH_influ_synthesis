#!/bin/bash

# Always run at least once
R -e 'Rcpp::compileAttributes(".",verbose=TRUE)';
# Should actually move needed header in inst/include/shinflusynthesis.h insted of using echo
R CMD check ../shinflusynthesis
R CMD INSTALL ../shinflusynthesis

R -e 'library(testthat);library(shinflusynthesis);test_dir("tests/manual/")'
