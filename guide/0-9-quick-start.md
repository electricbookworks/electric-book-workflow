---
title: Quick start
---

# Quick new-book setup

This quick setup assumes you already have Jekyll and Prince installed and working on your computer. There is more detail, and lots of more advanced guidance, in [this guide](http://electricbookworks.github.io/electric-book-workflow/).

## Create a basic book

1. Download the latest [series template folder](https://github.com/electricbookworks/electric-book).
2. Name the folder after your series. (Many series are 'one book' series. For instance, a self-standing novel by a new author. In this case, we usually give the series folder the same name as the book itself.
3. Rename the `book-template` folder after your book, using lowercase letters and no spaces. (E.g. `big-day`) This folder name is the book title's 'slug'.
4. Open `_data/meta.yml` and replace the sample book information there with your series and book information.
5. In your book folder (formerly `book-template`), edit or remove the sample files, and add your book's content in markdown files.

## Output to print PDF

In the series folder, run the `-pdf` script for your operating system. For Windows, it's called `win-pdf.bat`; for Linux, `linux-pdf.sh`.

> Note the Mac scripts are not working or available yet. We're still getting those right.
{:.box}

## Create a website

In your series folder, run the `-web` script for your operating system. For Windows, it's called `win-pdf.bat`; for Linux, `linux-pdf.sh`.

> Note the Mac scripts are not working or available yet. We're still getting those right.
{:.box}

## Create an epub

We're still working on a script to make this easier. For now, you need to:

1. Open a terminal or command prompt in (or navigate into) the series folder, and type `jekyll b --config="_config.yml,_config.epub.yml"`. This will generate epub-ready HTML in the `_site` folder.
2. Assemble the epub from the HTML in the `_site` folder using [Sigil](https://sigil-ebook.com/).

Follow the [instructions in our guide](http://electricbookworks.github.io/electric-book-workflow/guide/51-epub-output.html#epub-output) for this.

## Modify the design

The workflow includes the default Classic theme.

1. In the `_themes/classic/css` folder, open the `print.scss`, `web.scss` and/or `epub.scss` files.
2. Follow the instructions in the comments to edit the variable values (e.g. change `$margin-top: 15mm;` to `$margin-top: 20mm;`) and enable the fonts you want. If you're not sure about something, don't change it: the defaults work pretty well.
3. Add any custom CSS at the bottom.
