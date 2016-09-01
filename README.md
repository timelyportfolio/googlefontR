
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/timelyportfolio/googlefontR.svg?branch=master)](https://travis-ci.org/timelyportfolio/googlefontR)[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/googlefontR)](https://cran.r-project.org/package=googlefontR) [![Coverage Status](https://img.shields.io/codecov/c/github/timelyportfolio/googlefontR/master.svg)](https://codecov.io/github/timelyportfolio/googlefontR?branch=master)

Why googlefontR?
================

Google Fonts is a really incredible resource, but adding Google Fonts to R generated `HTML` can be a big pain. `googlefontR` tries to ease the pain with some helper functions.

Install
=======

Not on CRAN, so please install with `devtools`.

``` r
devtools::install_github("timelyportfolio/googlefontR")
```

Examples
========

``` r
library("googlefontR")
library("htmltools")

browsable(
  gf_add_font(
    tags$h1("Baloo Paaji provided by googlefontR"),
    "Baloo Paaji"
  )
)
```

Note the style is automatically applied to `body`. If you don't want this to happen, change `addstyle=FALSE`.

``` r
browsable(
  gf_add_font(
    tag_list = tags$h1("Baloo Paaji provided by googlefontR"),
    fontname = "Baloo Paaji",
    addstyle = FALSE
  )
)
```

Code of Conduct
===============

I welcome contributions. Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
