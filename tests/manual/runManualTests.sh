#!/bin/bash

# Always run at least once
R -e 'Rcpp::compileAttributes(".",verbose=TRUE)';
# Should actually move needed header in inst/include/sh_influ_synthesis.h insted of using echo
R CMD check ../sh_influ_synthesis
R CMD INSTALL ../sh_influ_synthesis

R -e 'library(testthat);library(sh_influ_synthesis);test_dir("tests/manual/")'
