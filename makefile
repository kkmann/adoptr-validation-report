.PHONY: build deploy-gh clean install-deps



clean:
	rm -rf _book
	rm -rf _bookdown_files
	rm -rf adoptr-validation-report.rds



install-deps:
	R -e 'install.packages("bookdown")'
	R -e 'install.packages("tidyverse")'
	R -e 'install.packages("devtools")'
	R -e 'devtools::install_github("kkmann/adoptr")'



build:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "all")'



deploy-gh-pages:
	git config --global user.email "kevin.kunzmann@mrc-bsu.cam.ac.uk"
	git config --global user.name "Travis CI build"
	git clone -b gh-pages \
		https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git \
	  	book-output
	cd book-output
	git rm -rf *
	cp -r ../_book/* ./
	git add --all *
	git commit -m "automatic deployment of latest master to gh-pages"
	git push -q origin gh-pages
