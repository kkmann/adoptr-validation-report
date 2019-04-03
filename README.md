[![Build Status](https://travis-ci.com/kkmann/adoptr-validation-report.svg?branch=master)](https://travis-ci.com/kkmann/adoptr-validation-report)

# **adoptr** Validation Report 

This repository contains code to build an automated validation report for the 
[![Build Status](https://travis-ci.com/kkmann/adoptr-validation-report.svg?branch=master)](https://travis-ci.com/kkmann/adoptr-validation-report)

[**adoptr**](https://github.com/kkmann/adoptr) R packag
e.
The report is build using R Markdown and the **bookdown** 
(https://github.com/rstudio/bookdown) package.
The most recent build of the validation report is hosted on this repository's 
GitHub pages site, [here](https://kkmann.github.io/adoptr-validation-report/).
The report itself contains a brief description of the neccessary steps to 
produce a report for a local installation of **adoptr**.

The following quality metrics are inspired by https://www.pharmar.org/packages/:

| **Metric**                         | **Value/Statement** |
|:-----------------------------------|:--------------------|
| **Vignette?**                      | yes, online version at https://kkmann.github.io/adoptr/articles/adoptr.html |
| **Website?**                       | yes, https://kkmann.github.io/adoptr |
| **Version Control?**               | yes, https://github.com/kkmann | 
| **Public/Open Source Developmen?** | yes, https://github.com/kkmann |
| **Formal Bug Tracking?**           | yes, https://github.com/kkmann/adoptr/issues |
| **Changelog?**                     | yes, https://kkmann.github.io/adoptr/news/index.html |
| **Release Cycle**                  | irregular |
| **Unit Testing?**                  | yes, [![codecov](https://codecov.io/gh/kkmann/adoptr/branch/master/graph/badge.svg)](https://codecov.io/gh/kkmann/adoptr) |
| **License**                        | MIT, https://github.com/kkmann/adoptr/blob/master/LICENSE.md |
| **CRAN?**                          | [![CRAN status](https://www.r-pkg.org/badges/version/adoptr)](https://cran.r-project.org/package=adoptr) |
| **Long-term storage?**             | yes, zenodo.org [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.2616952.svg)](https://doi.org/10.5281/zenodo.2616952) |
| **Bioconductor?**                  | No |
| **# reverse dependencies**         | 0 |
| **# Downloads**                    | Only available for R Studio CRAN mirror: [![R Studio CRAN monthly downloads](http://cranlogs.r-pkg.org/badges/last-month/adoptr?color=green)](https://cran.r-project.org/package=adoptr) |
| **Maturity**                       | Initial CRAN release date: 2019-04-01 |
| **Professional Maintainer?**       | No |



## Creating a Local Validation Report

To validate a local version of  **adoptr**, clone the validation report
source reposiotry via
```bash
git clone https://github.com/kkmann/adoptr-validation-report.git
```
and switch to the newly created folder
```bash
cd adoptr-validation-report
```
To build the book, you will need to install the dependencies listed in the DESCRIPTION file,
i.e.
```R
install.packages(c("tidyverse", "bookdown", "rpact", "testthat", "pwr"))
```
before finally beuilding the book by invoking
```bash
Rscript -e 'bookdown::render_book("index.Rmd", output_format = "all")'
```
(or executing the equivalent command in an R terminal in the same folder).
This will produce a `_book` folder with an `index.html` file that can be 
viewed in a browser as well as the PDF version of the validation
report.
