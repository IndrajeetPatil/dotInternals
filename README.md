
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{dotInternals}`: Dot Package Internal Functions <img src="man/figures/logo.png" align="right" width="240" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/IndrajeetPatil/dotInternals/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/IndrajeetPatil/dotInternals/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/IndrajeetPatil/dotInternals/branch/main/graph/badge.svg)](https://app.codecov.io/gh/IndrajeetPatil/dotInternals?branch=main)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of `{dotInternals}` is to set apart names of internal functions
from the ones exported by adding a dot (`.`) in front of their name. The
package automates this task in a scalable manner, and can be a nifty
tool for large legacy projects with tons of internal functions.

Having a separate naming pattern for exported versus non-exported
functions brings clarity to both users and developers about the public
API of the package.

You need to run this function in the **package root directory**. There
is also RStudio addin that you can use.

**Note**: This will not work if you have already run
`devtools::load_all()`/`pkgload::load_all()`.

Here is how functions will be renamed depending on whether they are
exported or not:

- For **exported functions**, names will not be changed:

``` r
# before        ---> after
extract_value() ---> extract_value() 
.draw_graph()   ---> .draw_graph()
```

- For **non-exported functions**, names will be prepended with a `.`,
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

## Acknowledgments

Hex sticker font is [Lato](https://fonts.google.com/specimen/Lato), and
the free clip-art image is taken from
[http://clipart-library.com](http://clipart-library.com/clipart/495897.htm).

## Code of Conduct

Please note that the dotInternals project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
