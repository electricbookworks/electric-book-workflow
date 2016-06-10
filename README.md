# The Electric Book Workflow

This workflow creates digital-first books in print, as ebooks, and for the web. We developed it for ourselves at [Electric Book Works](http://electricbookworks.com), for producing books that are largely text with some images, such as novels, non-fiction books, essays, papers, poetry, textbooks, manuals and reports.

It's a work in progress with a learning curve, but we've already used it to create high-quality books for very discerning publishers. Used well, it can completely replace InDesign for the production of book interiors.

[Read the guide](http://electricbookworks.github.io/electric-book-workflow/). As a little book, the guide is also an example of the workflow in action.

## Changelog

### 0.1.4

* Move all metadata out of `_config.yml`, into `_data` (no more setting up the slug)
* Support `<hr>` as text divider (\*\*\* in markdown)
* Minor improvements to code comments
* Minor improvement to layout of reference indexes

### 0.1.3

* Improve Windows batch script for PDF
* Add a Linux shell script for PDF
* Add Windows web batch script

### 0.1.2

* Experimental Windows batch file for PDF output
* Better image-set system using site variable
* Improved figure styling
* New control over image heights in figures to retain baseline grid
* Print-hiding for Sigil split markers
* Allow Prince hyphenation when no special dictionary is defined
* Fixed styling of .title-page-publisher
* Related documentation in Guide

### 0.1.1

* Add .title-page-publisher
* Liquid tags can populate whole title page and copyright page from _data
