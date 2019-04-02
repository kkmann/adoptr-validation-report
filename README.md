# **adoptr** Validation Report

This repository contains code to build an automated validation report for the 
[**adoptr**](https://github.com/kkmann/adoptr) R package.
The report is build using R Markdown and the **bookdown** 
(https://github.com/rstudio/bookdown) package.
The most recent build of the validation report is hosted on this repository's 
GitHub pages site, [here](https://kkmann.github.io/adoptr-validation-report/).



# Creating a Local Validation Report

In case you want to validate **adoptr** locally, first install it either from
CRAN or directly from Github.com.
Then clone this reposiotry
```bash
git clone https://github.com/kkmann/adoptr-validation-report.git
```
and switch to the newly created folder
```bash
cd adoptr-validation-report
```
To build the book, you will need to install the dependencies listed in the DESCRIPTION file,
i.e.
```
install.packages(c("tidyverse, "bookdown", "rpact", "testthat", "pwr"))
```
before finally invoking the `_build.sh` script on a linux command prompt
```bash
./_build.sh
```
This will produce a `_book` folder with an `index.html` file that you can view in a browser.
