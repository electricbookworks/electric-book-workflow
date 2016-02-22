---
title: Tables
---

# Tables

Kramdown (and most markdown variants) can only handle very simple tables. For these you can create the Markdown layout manually.

For complex tables – anything with merged cells, for instance – you must create an HTML table and paste that HTML (from `<table>` to `</table>`) into your markdown files. We use a WYSIWYG tool like Dreamweaver, which lets us paste a table from a formatted source like Word or LibreOffice, and then clean up the HTML easily before pasting the whole `<table>` element into our markdown document.

Add `{:.table-caption}` in the line immediately after a table caption. Kramdown uses this to apply the class `table-caption` to the paragraph. In our print output, this lets `print.css` avoid a page break after the caption, before the table. (According to publishing best-practice, table captions must always appear above tables, not after them.)

## Markdown-tables tools

Sometimes we use [Senseful's online tool](http://www.sensefulsolutions.com/2010/10/format-text-as-table.html) to create markdown tables quickly:

* Click and drag over some cells in the InDesign table (not the header row). Then Ctrl+A to select the whole table.
* Ctrl+C to copy, then paste into a blank spreadsheet.
* Select all the relevant cells in your spreadsheet, and copy. The table text is now on your clipboard, with the cells separated by tabs.
* Paste into the online Format Text as Table Input field.
* Click 'Create Table'. (The default settings are usually fine. Play with them only if you need to.)
* Copy the Output and paste it into your markdown file.
* The Senseful tool starts some table borders with + where kramdown needs a |. Manually change the starting + in any row with a |.
