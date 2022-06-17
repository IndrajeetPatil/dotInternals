
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dotInternals

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/IndrajeetPatil/dotInternals/branch/main/graph/badge.svg)](https://app.codecov.io/gh/IndrajeetPatil/dotInternals?branch=main)
[![R-CMD-check](https://github.com/IndrajeetPatil/dotInternals/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/IndrajeetPatil/dotInternals/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of `{dotInternals}` is to set apart names of internal functions
from the ones exported by adding a dot (`.`) in front of their name. The
package automates this task in a scalable manner, which comes in handy
for large legacy projects with tons of internal functions.

Having a separate naming pattern for exported versus non-exported
functions brings clarity to both users and developers about the public
API of the package.

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

There is an exception to this rule: `S3`/`S4` methods will not be
renamed, even if it is not exported.

``` r
# before        ---> after
str.my_class()  ---> str.my_class() 
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