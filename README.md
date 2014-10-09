# The EBW book framework

This repo is a framework for using Git, Jekyll and markdown to create books. We've developed it for in-house use at [Electric Book Works](http://electricbookworks.com). It's a work in progress.

To make our books, we needed a system that is easy for non-technical people to edit, includes great version control, produces books fast (no weeks laying out pages in InDesign), and instantly [spits out HTML](http://electricbookworks.github.io/book-framework/) we can use for the web, ebooks, apps, and print. By print, we mean high-end books you buy in a store, not just 'save as PDF'.

With this framework, in essence:

* we store our master files as markdown;
* we create HTML from that, as needed, using Jekyll.

This workflow is powerful enough to produce neat HTML we can use flexibly, and markdown is simple enough that non-technical people can be shown how to create and edit it.

## Alternatives

There are similar systems for this that use variants of Jekyll and/or markdown, such as [Gitbook IO](https://www.gitbook.io/) and [Phil Schatz's viewer](http://philschatz.com/2014/07/07/tiny-book-reader). 

We also like OERPub Editor, a web-based editor for non-technical people to create EPUB3 HTML that includes maths: see [the Textbook Editor here](http://oerpub.org/tools/). As a Javascript editor it runs in the browser and saves content in EPUB3 structure to a GitHub repo. Neat.

And remember that writers and editors can use the beautiful, simple and free [Prose](http://prose.io/) service to work on the text of any GitHub-backed system.

Systems like [PressBooks](http://pressbooks.com/) are also nice ways to get a digital-first workflow going. And if you're spending money then [O'Reilly Atlas](https://atlas.oreilly.com/) looks very promising.

## The workflow

Three are four key components to our workflow:

* content in markdown files
* GitHub for version control
* Jekyll for converting the markdown into HTML
* CSS stylesheets for each output format (we use one for screen output and one for print-PDF output, but you can add others).

So we keep a book's master content in markdown files, structured for Jekyll, on GitHub. For instance, our Bettercare books are here:

[https://github.com/electricbookworks/bettercare](https://github.com/electricbookworks/bettercare)

We use the [kramdown syntax](http://kramdown.gettalong.org/) for our markdown, because it's what GitHub uses. (Among other things, kramdown supports classes, so we can get almost everything we need for neat HTML. For complex tables and for figures, we use HTML inside the markdown docs.)

For books that we make free to read online, we let GitHub Pages publish the static HTML output, which it does automatically using Jekyll. For instance, Bettercare content appears here:

[http://electricbookworks.github.io/bettercare/](http://electricbookworks.github.io/bettercare/)

(In future, we'll make this GitHub Pages site output prettier. For now it's functional purpose is to give us HTML for reference and for reuse elsewhere.)

When we use this workflow for closed content, we don't use GitHub Pages. We use private GitHub repos for version control, and run Jekyll locally when we need to generate HTML from markdown. 

If you click through to a book chapter on our GitHub Pages view, you'll see the HTML we get from kramdown is very simple. For example, go view source here:

[http://electricbookworks.github.io/bettercare/nc/nc-1.html](http://electricbookworks.github.io/bettercare/nc/nc-1.html)

The key to simple HTML is that we carefully map our books' features to ordinary HTML elements. That way, we need very few classes, and can easily use the same HTML with simple stylesheets for the web, our app, epub, and output to print PDF using PrinceXML. And our HTML content remains readable in readers and low-bandwidth browsers that don't support publisher CSS. For instance, see our Book Dash books:

[http://bookdash.github.io/bookdash-books/](http://bookdash.github.io/bookdash-books/)

## The repo structure

The repo structure follows pretty much standard Jekyll structure. In the root are `_include`, `_layouts` and `css` folders, and `_config.yml` and `index` files. The simple `header.html` and `footer.html` includes, and `default`, `chapter`, `frontmatter`, `copyright` and `toc` layouts should be a good start for most books. But every case will be different, and you'll have to make additions to suit the project. This is especially the case for the CSS.

One framework repo can hold one or many books (for instance all the books in a series with consistent structure and layout). Each book's content is in a folder in the root. In the framework here, we have `book-one` with a few sample files in it:

* title page
* copyright page
* table of contents
* acknowledgements
* a first chapter

Each document is a section of the book, which traditionally might be separated from others by a page break, and begin with a first-level heading (e.g. an `<h1>`).

Alongside the content files in that book's folder is an `images` folder, for images that belong to that book only.

A book's folder should only ever need to contain markdown files and images. If you're embedding other kinds of media you could add folders for that alongside `images`. We don't recommend sharing images or media between books, in case you want to move a book from one repo to another later. (E.g. copy the publisher logo into each book's `images` folder separately.)

## Creating a book in markdown

Here are some guidelines we've created for our own use. They are probably applicable to other books, too.

### Before you start

* Read through all these notes, including the tips at the end. You may not understand it all at first, but you need to plant all these seeds in your brain for when you need them.
* Have the [Markdown syntax reference](daringfireball.net/projects/markdown/syntax) to hand. It's the easiest intro to basic markdown.
* For more advanced syntax (e.g. for tables and for adding classes), see the [kramdown syntax](http://kramdown.gettalong.org/syntax.html) and [kramdown quick reference](http://kramdown.gettalong.org/quickref.html). 
* Use a good text editor (there are dozens of options, e.g. Notepad++ on Windows, or TextWrangler on Mac).
* If you're working on Windows, set your default character encoding for your documents to 'UTF without BOM'. (Jekyll will break if you don't.)
* To check how small bits of markdown will convert to HTML, use the [online pandoc tryout](http://johnmacfarlane.net/pandoc/try). If you know how to set up a local Jekyll site or quick pandoc conversion to HTML, do that to see what your Markdown does in HTML as you work. Note: GitHub Pages, and possibly your local Jekyll instance, use kramdown, which parses markdown slightly differently to pandoc's default. So you might get different results in each, especially with tables. Jekyll with kramdown matters most.
* If you need to learn about or install Jekyll, [start here](http://jekyllrb.com/). If you're on Windows, [you'll need this](http://jekyll-windows.juthilo.com/).

### Our guide to converting content to markdown

This is what we do when we convert one of our textbooks from a traditional InDesign workflow to markdown for this book framework. You'll probably develop your own if you're turning existing books into markdown.

1. Open the InDesign file and copy all the text.
1. Paste the text with formatting into your text editor.
1. Search and replace (S&R) all line breaks with double line breaks:
	* Tick 'Regular expression' (because you're using the regex `\n` to mean 'line break', not actually searching for the characters 'slash' and 'lowercase en').
	* Find `\n`
	* Replace with `\n\n`
1. Comparing to a laid-out, up-to-date version of the book, mark all headings with markdown's heading hashes (#) according to their heading level. E.g.:
	* `h1` = `#`
	* `h2` = `##`
	* `h3` = `###`, and so on.
1. At the same time, you may want to manually create Markdown lists using `*` for bullets and `1.` , `2.` , `3.` etc. for numbered lists. Note that list indents can get complicated, so check previous chapters and test your markdown-to-HTML conversion when you hit a tricky one (e.g. a note inside a bullet list nested inside a numbered list).
1. Add Markdown image references. For images without captions, use regular image syntax: `![Alt text][id]`, then at the end of the document, we list all that chapter's images, each one as `[id]: url/to/image  "Optional title attribute"`. This makes it easy to check all image paths and attributes at once. Note: the path to images is `{{ site.baseurl }}/images/filename.svg` (this path ensures our Jekyll server can find the images on local machines or on GitHub Pages). If you need captions, it's better to use `<figure>` HTML elements, in actual HTML. This way `print.css` can prevent your images and their captions getting separated over pages. More on this later.
1. Look out for italic and bold, and manually mark these in markdown with asterisks: in markdown, `*italic*` is *italic* and `**bold**` is **bold**. It's best to search the InDesign document for these instances so you don't miss any.
1. Look out for special characters, especially degree symbols (°), superscripts and subscripts. It's best to search the InDesign document (search by style and basic character formats, e.g. 'Position' for superscript and subscript) for these instances so you don't miss any. Most superscripts and subscripts in InDesign and similar are created by formatting normal text. In text-only, there is no formatting, so you should use the [unicode character for each superscript or subscript character](http://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts). E.g. when typing the symbol for oxygen, O₂, the subscript 2 is ₂, unicode character U+2082. To type these characters, you may need special software (e.g. for Windows, Google unicodeinput.exe), or copy-paste from [an online reference](http://scriptsource.org/cms/scripts/page.php?item_id=character_list&key=2070). In Windows, you can also find symbols in Character Map, e.g. search in Character Map for 'Subscript Two'.
1. Kramdown (and most markdown variants) can only handle simple tables. For these you can create the Markdown layout manually or use something like [Senseful's online tool](http://www.sensefulsolutions.com/2010/10/format-text-as-table.html). To do this:
	* Click and drag over some cells in the InDesign table (not the header row). Then Ctrl+A to select the whole table.
	* Ctrl+C to copy, then paste into a blank spreadsheet.
	* Select all the relevant cells in your spreadsheet, and copy. The table text is now on your clipboard, with the cells separated by tabs.
	* Paste into the online Format Text as Table Input field.
	* Click 'Create Table'. (The default settings are usually fine. Play with them only if you need to.)
	* Copy the Output and paste it into your markdown file.
	* The Senseful tool starts some table borders with + where kramdown needs a |. Manually change the starting + in any row with a |.
1. For complex tables, you must create HTML. We use easy WYSIWYG tools like Dreamweaver, which lets us paste a table from a formatted source like Word or LibreOffice, and then clean up the HTML easily before pasting the whole `<table>` element into our markdown document.

### Images

*	Wherever possible, convert images to SVG so that they scale beautifully but also remain small in file-size for web use. 
*	Ensure that raster images, or raster/bitmap elements in SVG, are high-res enough for printing (e.g. 300dpi at full size). 
*	Embed images placed in your SVG image, don't just link them.
*	Save images in the book's `images` folder.

Here's our most common workflow for converting images to SVG:

*	If the image was created in InDesign (e.g. a flowchart made of InDesign frames): open in InDesign, group the frames that make up the image, copy, and paste into a new Illustrator file. Adjust Illustrator file artboards as necessary, then save as SVG.
*	If the image was created in Photoshop or other raster format: open the original, copy into Illustrator. Live trace the image. (We mostly use the 'Detailed Illustration' preset.) Save as SVG. You can also use the trace function in Inkscape instead of Illustrator.
*	If you save SVG from Adobe Illustrator (and possibly other creators, too), choose to convert type to outlines. (For us, the main reason for this is that PrinceXML gives unpredictable results with type in SVG. But it's probably safest generally to convert type to outlines for consistent output.)

We do not use markdown to embed images with captions, because kramdown doesn't support enclosing the image and caption in a `<figure>` element. We need the `<figure>` element for our PDF output, mainly so that images and their captions don't break over pages. So we use this HTML code for each image:

~~~ html
<figure>
	<img src="../images/filename.svg" alt="A description of the image">	
	<figcaption>Figure 1: This is the caption.</figcaption>
</figure>
~~~

That's all, no markdown notation for the image, and no list of images at the end of the doc. We just put this code (with the file name, alt and caption changed of course) for each figure exactly where it's relevant in the text.

## Stylesheets

We've provided generic stylesheets in the framework, but each project will need its own styling for one reason or another.

Keep in mind, regarding our stylesheets:

*	Our CSS files for print (e.g. `print.css` and `office-a4.css` are designed specifically for use with [Prince](http://princexml.com).
*	We use `normalize.css` to get consistency across browsers. (You could consider [alternatives](http://www.cssreset.com/).)
*	Use the class `non-printing` for elements that should only appear on screen versions of your book, but not in the printed book (like buttons or video embeds). Our stylesheets will hide them from Prince (with `display: none;`).
*	Glance through our stylesheets to see what's useful, especially in `print.css`. E.g. the `.keep-together`, `.keep-with-next` and `page-break-before` classes, which you can add to almost any element in kramdown. For instance, include `{:.keep-together}` in the line immediately after a paragraph to stop it breaking.

## Trial-and-error tips

We've learned some stuff the hard way:

*	You may get different results between a local Jekyll install and GitHub Pages, even if both are using kramdown. Always check (at least spot check) both places.
*	Do not use a colon `:` in the title you include in your YAML header (inside the `---`s at the tops of files). For instance, you can't have `title: Beans: The musical fruit`. Jekyll will break, unsure if you're trying to map a second value to the YAML key. You'll have to do something like `title: Beans—The musical fruit`.
*	In lists, kramdown lets you use a space *or* a tab between the list marker (e.g. `*` or `1.` etc.) and the list test. If only to solve an issue with nesting blockquotes in lists, *use a tab* between the list marker and the start of the list text, and the same tab at the start of the blockquote line. That is, the indentation (the tab) must be exactly the same for the blockquote to nest correctly in the list. (My local Jekyll instance correctly parses nested lists even if I use a space after the list marker and a tab before the blockquote `>`. But GitHub Pages is much stricter and requires exactly the same indentation.) E.g. see [Newborn Care 12-5](http://electricbookworks.github.io/bettercare/nc/nc-12.html#how-can-you-prevent-infection-in-newborn-infants).
*	Add `{:.table-caption}` in the line immediately after a table caption. Kramdown uses this to apply the class `table-caption` to the paragraph. In our print output, this lets `print.css` avoid a page break after the caption, before the table. (According to publishing best-practice, table captions must always appear above tables, not after them.)
*	Keep file naming perfectly alphabetical This is easiest to do with a numbering system, e.g. `great-gatsby-0-1-titlepage.md`, `great-gatsby-0-2-copyright.md`, `great-gatsby-1-chapter-1.md`, and so on. The alphabetical order makes it easy to see the documents in the right order at all times, and it makes ordering files during PrinceXML PDF-making really easy.
*	When running Jekyll locally, and *if* your repo is a project using GitHub Pages (not an organisation or user site), you'll need to add `--baseurl ''` when running Jekyll at the command line. [Here's how and why](http://jekyllrb.com/docs/github-pages/#project-page-url-structure).
*	If you choose *not* to `.gitignore` your `_site` folder (as we have done), it'll contain (and sync to GitHub) your local machine's most recent Jekyll HTML output. (The `_site` folder has nothing to do with what GitHub Pages publishes.) We choose to do this so that it's easy for collaborators to grab a book's HTML from our repo without having to run Jekyll themselves. But it means committers have a responsibility to make sure their Jekyll instance does a good job, and that their `_site` output is up-to-date with the latest changes to the underlying markdown.

## Print output

We use [PrinceXML](http://princexml.com/) to turn Jekyll's HTML into beautiful, print-ready book files. We haven't found anything as good as Prince, so we reckon it's worth its price tag. And you can use the trial version to get your print output perfect before committing to the price. So our framework's CSS files for printing are designed specifically for Prince.

### Creating PDF files with the Prince GUI

1.	Find your book's HTML files in your `_site` folder. (Remember to run Jekyll locally to generate the latest version; if you're getting your HTML from a GitHub repo's `_site` folder, trust that the last contributor synced up-to-date, reliable HTML generated by their local Jekyll instance.)
2.	Drag the HTML files into Prince. Make sure they're in the right order.
3.	Tick ‘Merge all…’ and **specify an output file** location and name. Do not let Prince output to your `_site` folder. (If you skip this, Prince will output to your `_site` folder, which will cause permissions issues when you want to modify or delete the file, because Jekyll owns the `_site` folder. Plus, Git will try to commit and sync the output PDF, which you don't want.)
4.	Drag the CSS file for printing into Prince. The framework provides options:
	*	`print.css` which produces an A5 document with crop marks for high-end printing and binding;
	*	`office-a4.css` which produces an A4 document for regular office printing.
5.	Click Convert.

Note: the links to CSS in our output HTML `<head>` *deliberately* break the link to `screen.css` and `normalize.css` when using Prince, so that you don't get screen styles in your print output. You can ignore error messages from Prince saying it can't find these files.
