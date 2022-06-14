
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dotInternals

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/IndrajeetPatil/dotInternals/branch/main/graph/badge.svg)](https://app.codecov.io/gh/IndrajeetPatil/dotInternals?branch=main)
[![R-CMD-check](https://github.com/IndrajeetPatil/dotInternals/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/IndrajeetPatil/dotInternals/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `{dotInternals}` is to set apart names of internal functions
from the ones exported by adding a dot (`.`) in front of their name.

For example, here are how functions can be renamed depending on whether
they are exported or not:

-   For **exported functions**, names will not be changed:

``` r
# before        ---> after
extract_value() ---> extract_value() 
.draw_graph()   ---> .draw_graph()
```

-   For **non-exported functions**, names will be prepended with a `.`,
    but only if it isn’t already named that way:

``` r
# before        ---> after
extract_value() ---> .extract_value() 
.draw_graph()   ---> .draw_graph()
```

## Installation

You can install the development version of `{dotInternals}` from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("IndrajeetPatil/dotInternals")
```

## Code of Conduct

Please note that the dotInternals project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
