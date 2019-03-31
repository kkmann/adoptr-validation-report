#!/usr/bin/env bash

Rscript -e 'bookdown::render_book("index.Rmd", output_format = "all")'
