# The Electric Book Workflow

This workflow creates digital-first books in print, as ebooks, and for the web. We developed it for ourselves at [Electric Book Works](http://electricbookworks.com), for producing books that are largely text with some images, such as novels, non-fiction books, essays, papers, poetry, textbooks, manuals and reports.

It's a work in progress with a learning curve, but we've already used it to create high-quality books for very discerning publishers. Used well, it can completely replace InDesign for the production of book interiors.

[Read the guide](http://electricbookworks.github.io/electric-book-workflow/). As a little book, the guide is also an example of the workflow in action.

## Changelog

### 0.2.3

* Fix broken pink to print stylesheets.
* Fix broken links in @font-face partials.
* Add more font includes.
* Turn on kramdown auto_id_stripping to keep IDs neat and persistent, and ahead of 2.0 where this will be default.
* Fix line-height on chapter-numbers to retain baseline grid.

### 0.2.2

* Improve navigation layout.
* Simplify tag for embedding YouTube video.
* Add ability to combine `.smallcaps`/`.allsmallcaps` with `.bold` and `.italic` for italic/bold small caps.
* Add `web.scss` variables for media-query break points.
* Fix bug causing horizontal overflow.

### 0.2.1

* Bug-fix broken links in new nav include.
* Improve template index page.
* Make default web typography paras space-between (not text indent).

### 0.2.0

* Move series template out into its own repo for easier forking/copying.
* Move themes into `_themes` folder (better theme management, and in line with likely forthcoming Jekyll theme structure).
* Improve `nav` and `footer` elements to give themes more to work with, and allow for fuller web output chapter menus.
* Change `print-list` to `file-list` and auto-generate from file lists per product in `meta.yml`.
* Create `win-epub.bat` to speed up EPUB creation.
* Improve Windows batch files for output to print PDF and PDF ebook
* Add CSS options for pure black in addition to rich black, and a $start-depth variable to keep chapter openers consistent more easily.
* Add template folders and minimal guidance for using Javascript.
* Update and improve Guide text in many places, mainly where it was out of date.
* Various minor improvements.

### 0.1.4

* Move all metadata out of `_config.yml`, into `_data` (no more setting up the slug)
* Support `<hr>` as text divider (\*\*\* in markdown)
* Minor improvements to code comments
* Minor improvement to layout of reference indexes
* Fix for blank baseurl in `win-web.bat` launcher
* Minor text edits

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
