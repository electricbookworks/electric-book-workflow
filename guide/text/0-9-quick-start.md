---
title: Quick start
---

# Quick new-book setup

This quick setup assumes you already have Jekyll (>= v3.2) and Prince installed and working on your computer. There is more detail, and lots of more advanced guidance, in [this guide](http://electricbookworks.github.io/electric-book-workflow/).

## Create a basic book

1. Download the [Jekyll template](https://github.com/electricbookworks/electric-book).
2. At the command line, navigate to the `electric-book` folder and run `bundle install`.
2. Open `_data/meta.yml` and replace the sample book information there with your series and book information.
3. In the `book` folder edit or remove the sample files, and add your book's content.

## Output to PDF

Run the `[OS]-print-pdf` or `[OS]-screen-pdf` scripts for your operating system. (e.g. `win-print-pdf.bat` in Windows).

## Serve a website locally

Run the `[OS]-web` script for your operating system. (e.g. `win-web.bat` in Windows).

> OSX and Linux scripts are not done yet. Instead, in a terminal in the same folder as the scripts, run `bundle exec jekyll s`.
{:.box}

## Create an epub

Run the `[OS]-epub` script for your operating system. (e.g. `win-epub.bat` in Windows). This will generate epub-ready HTML and open the cover file in Sigil, importing metadata automatically. Assemble your epub in Sigil, following the [instructions in our guide](http://electricbookworks.github.io/electric-book-workflow/guide/51-epub-output.html#epub-output) for this.

> OSX and Linux scripts are not done yet. Instead, in a terminal in the same folder as the scripts, run `bundle exec jekyll b --config="_config.yml,_config.epub.yml"`. Then from Sigil, open the `0-0-cover.html` file in `_html/book/text`. That will import book metadata, and you can then assemble the epub in Sigil.
{:.box}

## Modify the design

The workflow includes the default Classic theme. To add modify styles:

1. In `book/styles`, open `print-pdf.scss`, `screen-pdf.scss`, `web.scss` and/or `epub.scss`.
2. Follow the instructions in the comments to edit variable values, enable fonts, and add custom CSS.

To see the parent styles you're overriding, [browse the Classic theme repo](https://github.com/electricbookworks/electric-book-classic-theme).
