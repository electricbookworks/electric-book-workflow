# The EBW book framework

This framework provides a digital-first workflow for creating books in print, as ebooks, and for the web. We developed it for ourselves at [Electric Book Works](http://electricbookworks.com), for producing books that are largely text with some images, such as novels, non-fiction books, essays, papers, poetry, textbooks, manuals and reports.

We needed a system that is easy for non-technical people to edit, includes great version control, produces books fast (no InDesign except for cover design), and instantly produces HTML we can use for the web, ebooks, apps, and print. By print, we mean high-end books you buy in a store, not just 'save as PDF'.

With this framework:

1.	We store a book's master files in plain text (formatted as [markdown](http://daringfireball.net/projects/markdown/syntax#philosophy)).
2.	We turn that plain text into clean HTML instantly (using [Jekyll](http://jekyllrb.com/)).
3.	We apply different stylesheets to that HTML to get beautiful print PDFs, web versions, and ebooks in minutes.

Markdown is so simple that non-technical people can learn how to create and edit it in under an hour. (They can even work directly on the master files remotely using [Prose](http://prose.io/).)

## Alternatives

There are several digital-first book-publishing systems around. 

Some are also based on markdown, like ours:

*	[Gitbook IO](http://www.gitbook.io/)
*	[Penflip](http://www.penflip.com/)
*	[Phil Schatz's viewer](http://philschatz.com/2014/07/07/tiny-book-reader). 

[PressBooks](http://pressbooks.com/), which is built on Wordpress, is a superb, affordable service. 

And if you're a serious publishing outfit, have a look at [O'Reilly Atlas](https://atlas.oreilly.com/).

[OERPub Editor](http://oerpub.org/tools/) is a web-based editor for non-technical people to create EPUB3 HTML that includes maths. As a Javascript editor it runs in the browser and saves content in EPUB3 structure to a GitHub repo. Neat.

## Background reading

To manage this framework yourself, you need to be familiar with a few concepts and tools first. 

*	You need to have a solid understanding of HTML and CSS.
*	You need to know about markdown. Read the original [Markdown syntax reference](http://daringfireball.net/projects/markdown/syntax). It's the easiest intro to basic markdown. We use a markdown variant called [kramdown](http://kramdown.gettalong.org), because it's GitHub's default and it supports some extra features, especially classes. 
*	Jekyll is the machine that minces markdown into HTML files. To learn about Jekyll, [start here](http://jekyllrb.com/). If you're installing it on Windows, [you'll also need this guide](http://jekyll-windows.juthilo.com/).
*	For version control, we use Git. Specifically, we use [GitHub](http://github.com), the leading hosted Git service, for online file storage and version control.

## The workflow

These are the key components in our workflow:

*	Content in plain-text, formatted as kramdown-based markdown
*	GitHub for version control
*	Jekyll for converting the markdown into HTML
*	CSS stylesheets for each output format
*	Prince for creating PDFs from HTML (the only proprietary part of this stack)
*	Sigil for assembling the HTML in epubs.

So we keep a book's master content in markdown files, structured for Jekyll, on GitHub. For instance, our Bettercare books are here:

[https://github.com/electricbookworks/bettercare](https://github.com/electricbookworks/bettercare)

We use the [kramdown syntax](http://kramdown.gettalong.org/) for our markdown, because it's what GitHub uses and it has important features, such as classes.

For open-source books, we let GitHub Pages publish the static HTML output, which it does automatically, also with Jekyll. For instance, our staging site for Bettercare content is here:

[http://electricbookworks.github.io/bettercare/](http://electricbookworks.github.io/bettercare/)

(For Bettercare, we have a [separate live site](http://ls.bettercare.co.za) where we host the static HTML.)

When we use this workflow for closed content, we don't use GitHub Pages, and store the content in private GitHub repos.

If you click through to a book chapter on our GitHub Pages view, you'll see the HTML we get from kramdown is very simple. For example, view source here:

[http://electricbookworks.github.io/bettercare/nc/nc-1.html](http://electricbookworks.github.io/bettercare/nc/nc-1.html)

The key to simple HTML is that we carefully map our books' features to ordinary HTML elements. That way, we need only a few classes, and can easily use the same HTML with simple stylesheets for the web, apps, epub, and print output. And our HTML content remains readable in readers and low-bandwidth browsers with low CSS support. For instance, see the [Book Dash](http://bookdash.org) books:

[http://bookdash.github.io/bookdash-books/](http://bookdash.github.io/bookdash-books/)

Finally, to turn our HTML into print PDFs, we use [PrinceXML](http://princexml.com). And we use Sigil to put our HTML into EPUB2-valid epubs. This way, we can create print PDFs or epubs in a  matter of minutes. (More on print and epub output below.)

## The repo structure

The framework repo's folders and files follow the [standard Jekyll structure](http://jekyllrb.com/docs/structure/): in the root are `_include`, `_layouts` and `css` folders, and `_config.yml` and `index` files. The HTML snippets in `_includes` and `_layouts` should be enough for most simple books. But every case will be different, and you may have to make additions to suit your project. This is especially the case for the CSS.

One framework repo can hold one or many books (for instance all the books in a series, since all books in a collection may use the same CSS). Each book's content is in its own folder in the root. 

In the framework repo, we have `book-one` as an example with a few sample files in it. In each file's YAML header, we specify the style to use – that is, how will this section of the book look? (That `style` YAML sets the class of the output HTML's `<body>` element. We use these to control CSS and page structure.)

| Book section      | Sample file               | Style in YAML   |
|-------------------|---------------------------|------------------|
| Front cover       | `0-0-cover.md`            | `cover`          |
| Title page        | `0-1-titlepage.md`        | `title-page`     |
| Copyright page    | `0-2-copyright.md`        | `copyright-page` |
| Table of contents | `0-3-contents.md`         | `contents-page`  |
| Acknowledgements  | `0-4-acknowledgements.md` | `chapter`        |
| A first chapter   | `1.md`                    | `chapter`        |
| A second chapter  | `2.md`                    | `chapter`        |

If you don't set the `style`, the page will default to `style: chapter`. (So you don't need to ever set `style: chapter` in a YAML header.)

Page layouts we've designed for in our template CSS are:

*	`index` for the home page of a collection
*	`cover` for a front cover, which will appear in ebook editions
*	`halftitle-page` for a book's halftitle page
*	`previous-publications-page` for a book's list of the author's previous publications
*	`title-page` for a book's title page
*	`copyright-page` for the copyright or imprint page
*	`contents-page` for the book's table of contents
*	`dedication-page` for a dedication page
*	`epigraph-page` for an epigraph page
*	`frontmatter` for other prelim pages not accounted for otherwise
*	`chapter` for a book's default chapter page (and the global default)

If you don't want the navigation (nav bar and footer) on a page, such as the collection's index page, add `layout: min` to the document's YAML header. The `min` layout does not include a nav-bar and footer.

### The `images` folder

Alongside the content files in a book's folder is an `images` folder, for images that belong to that book only.

A book's folder should only ever need to contain markdown files and images. If you're embedding other kinds of media you could add folders for that alongside `images`. We don't recommend sharing images or media between books, in case you want to move a book from one repo to another later. (So, for example, copy the publisher logo into each book's `images` folder separately.)

## Setting up

To create a new book in a new collection:

1. The `book-framework` is a template for a collection. Make a copy and rename it for your collection. E.g. `my-sci-fi`.
2. Inside `my-sci-fi`, open and edit these three files:
	*	`_config.yml`: Edit the values there for your collection. The comments will guide you.
	*	`index.md`: Read and replace the book-framework template text with your own.
	*	`README.md`: Replace all the book-framework description text with any notes your collaborators might need to know about your collection.
3.	Rename the `book-one` folder with a short folder-name version of your book's title. Use only lowercase letters and no spaces. If you're creating more than one book, make a copy of this folder for each one. Each book gets its own folder.
4.	Inside the book's folder, edit and add a markdown file for each piece of your book, e.g. one file per chapter, as our examples suggests. 
5.	Inside the book's folder, store images in the `images` folder. 
	*	Replace the `publisher-logo.svg` file with your imprint or brand's logo. 
	*	Replace the `cover.jpg` image with your book's front cover image. For best results, use an image almost but less than 1000px on its longest side. (More on images below.)

## Creating a book in markdown

Here are some guidelines we've created for our own use. They are probably applicable to other books, too. For examples, read this in conjunction with the [template's examples here](http://electricbookworks.github.io/book-framework/).

Before you start:

*	Read through all these notes, including the tips at the end. You may not understand it all at first, but you need to plant all these seeds in your brain for when you need them.
*	Use a good text editor (there are dozens of options, e.g. Notepad++ on Windows, or TextWrangler on Mac).
*	If you're working on Windows, set your default character encoding for your documents to 'UTF without BOM'. (Jekyll will break if you don't.)
*	To check how your markdown converts to HTML while you work, you can use [this Online Kramdown Editor](http://kramdown.herokuapp.com/) by [Daniel Perez Alvarez](https://github.com/unindented/online-kramdown-sinatra).
*	Keep the [kramdown quick reference](http://kramdown.gettalong.org/quickref.html) handy. 
*	Look through our [example template here](http://electricbookworks.github.io/book-framework/) to get an idea of available default typography.

### Converting from InDesign

This is what we do when we convert one of our textbooks from a traditional InDesign workflow to markdown for this book framework. You'll probably develop your own process for turning existing books into markdown.

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
1. Add Markdown image references. See the images section below for detail on how best to do this.
1. Search for every instance of italic, bold and bold-italic, and manually mark these in markdown with asterisks: in markdown, `*one asterisk*` is *italic*, `**two**` is **bold**, and `***three***` is ***bold-italic***. Remember that in some fonts, italic and bold may have different names in InDesign, like 'oblique' and 'black'.
1. Look out for special characters, especially degree symbols (°), superscripts and subscripts. It's best to search the InDesign document (search by style and basic character formats, e.g. 'Position' for superscript and subscript) for these instances so you don't miss any. Most superscripts and subscripts in InDesign and similar are created by formatting normal text. In text-only, there is no formatting, so you should use the [unicode character for each superscript or subscript character](http://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts). E.g. when typing the symbol for oxygen, O₂, the subscript 2 is ₂, unicode character U+2082. To type these characters, you may need special software (e.g. for Windows, Google unicodeinput.exe), or copy-paste from [an online reference](http://scriptsource.org/cms/scripts/page.php?item_id=character_list&key=2070). In Windows, you can also find symbols in Character Map, e.g. search in Character Map for 'Subscript Two'.

### Tables

Kramdown (and most markdown variants) can only handle very simple tables. For these you can create the Markdown layout manually.

For complex tables – anything with merged cells, for instance – you must create an HTML table and paste that HTML (from `<table>` to `</table>`) into your markdown files. We use a WYSIWYG tool like Dreamweaver, which lets us paste a table from a formatted source like Word or LibreOffice, and then clean up the HTML easily before pasting the whole `<table>` element into our markdown document.

Add `{:.table-caption}` in the line immediately after a table caption. Kramdown uses this to apply the class `table-caption` to the paragraph. In our print output, this lets `print.css` avoid a page break after the caption, before the table. (According to publishing best-practice, table captions must always appear above tables, not after them.)

#### Markdown tables tip

Sometimes we use [Senseful's online tool](http://www.sensefulsolutions.com/2010/10/format-text-as-table.html) to create markdown tables quickly:

* Click and drag over some cells in the InDesign table (not the header row). Then Ctrl+A to select the whole table.
* Ctrl+C to copy, then paste into a blank spreadsheet.
* Select all the relevant cells in your spreadsheet, and copy. The table text is now on your clipboard, with the cells separated by tabs.
* Paste into the online Format Text as Table Input field.
* Click 'Create Table'. (The default settings are usually fine. Play with them only if you need to.)
* Copy the Output and paste it into your markdown file.
* The Senseful tool starts some table borders with + where kramdown needs a |. Manually change the starting + in any row with a |.

### Images

#### Preparing images

*	Wherever possible, convert images to SVG so that they scale beautifully but also remain small in file-size for web use. 
*	Ensure that raster images, or raster/bitmap elements in SVG, are high-res enough for printing (e.g. 300dpi at full size). 
*	Embed images placed in your SVG image, don't just link them.
*	Save images in the book's `images` folder.

Here's our most common workflow for converting images to SVG:

*	If the image was created in InDesign (e.g. a flowchart made of InDesign frames): open in InDesign, group the frames that make up the image, copy, and paste into a new Illustrator file. Adjust Illustrator file artboards as necessary, then save as SVG.
*	If the image was created in Photoshop or other raster format: open the original, copy into Illustrator. Live trace the image. (We mostly use the 'Detailed Illustration' preset.) Save as SVG. You can also use the trace function in Inkscape instead of Illustrator.
*	If you save SVG from Adobe Illustrator (and possibly other creators, too), choose to convert type to outlines. (For us, the main reason for this is that PrinceXML gives unpredictable results with type in SVG. But it's probably safest generally to convert type to outlines for consistent output.)

#### Adding images in markdown

We use standard markdown to embed images:

```
![The image alt text](pth/to/image.svg)
```

Most of our images are figures. That is, they include an image followed by a caption. We put these together in a `<blockquote>` element with a `.figure` class. We can then control placement by styling the `<blockquote>`.

The reason we use a blockquote is that it lets us keep images and their captions together. A `<figure>` element would be better HTML, but it won't validate in EPUB2, and can't be created with kramdown. 

Here's an example of markdown for a figure:

```
> ![Figure 2-A: The Ballard scoring method](images/fig-2-A.svg)
> 
> Figure 2-A: The Ballard scoring method
{:.figure}
```

Every line (except the `{:.figure}` class tag at the end) starts with a `>` and a space. These wrap the figure (image and caption) in a `blockquote` element. 

The first line is the image reference. It consists of:

*	an exclamation mark telling markdown that we're placing an image
*	the `alt` attribute in square brackets
*	the path to the image file.

The third line is the figure caption, followed by the kramdown tag `{:.figure}`, which lets our stylesheets format the `blockquote` as a figure. (For instance, preventing a page break between the image and the caption in print.)

If your image has no caption, just skip the empty line and caption line:

```
> ![Figure 2-A: The Ballard scoring method](images/fig-2-A.svg)
{:.figure}
```

If it's important to you that the image isn't in a blockquote, and there is no caption, you can use:

```
![Figure 2-A: The Ballard scoring method](images/fig-2-A.svg)
{:.figure}
```

Always check print output (putting the HTML Jekyll creates through Prince with `print.css`) to be sure you're getting what you intend.

#### Image placement

You may need to control how an image is sized and placed on the page – especially in print – depending on its detail or aspect ratio and nearby images or other elements. You do this by adding the class tag to the line after the `>` lines. (This applies a class to the blockquote in HTML.) You have these options:

* `.x-small` limits the image height. In print, to 30mm.
* `.small` limits the image height. In print, to 45mm.
* `.medium` limits the image height. In print, to 65mm, which allows two figures with shortish captions to fit on a page.
* `.large` fills the width and most of a printed page, up to 150mm tall. Try to put these images at the end of a section, because they cause a page break.
* `.fixed` keeps the figure in its place in the text flow, and will not float it to the top or bottom of a page. For instance, when an image must appear in a step-by-step list of instructions.

You add these classes to the `{:.figure} tag like this:

`{:.figure .small}`

`{:.figure .fixed}`

and so on. You can combine size and placement classes like this, too:

`{:.figure .fixed .small}`

#### Recommended image sizes

We like to use these settings where possible:

*	Default width: 115mm
*	Aspect ratios: 4:3 (portrait or landscape), a closer ratio, or square. Images at wider ratios (e.g. 16:9) than 4:3 make layout more difficult.
*	Therefore, maximum height is 150mm. (That's very slightly less than a 4:3 height:width ratio.)

Using Illustrator? Different SVG editors treat image size differently. For instance, a 2-inch-wide image in Illustrator will appear 1.6 inches wide in Prince and Inkscape. Why? Because when creating the SVG's XML, Illustrator includes its dimensions in pixels, and *assumes a 72dpi resolution*, where Prince and Inkscape follow the W3C SVG spec and assume 90dpi. As a result, images coming out of Illustrator always appear 80% of their intended size. So, if you're creating images in Illustrator, set your image sizes to 125% of what you intend to appear in the book. That means:

*	default width 115mm × 125% = 143.75mm
*	max height (at 4:3) = 190mm

Check out [Adobe's guidance on saving SVGs](https://helpx.adobe.com/illustrator/using/saving-artwork.html#save_in_svg_format).

#### Resolution

*	For SVG images, the editor you use will determine underlying resolution. Illustrator uses 72dpi, and Inkscape 90dpi. We favour and assume 90dpi, but can rescale SVG images with  our stylesheets just in case.
*	For JPGs, our default resolution should be 200dpi and image quality of 80 ('very high' in Adobe presets). This allows for reasonable print quality while keeping file sizes sensible for web delivery. The higher resolution also allows ebook users to zoom in for more detail.
*	To get a 200dpi JPG that is 115 mm wide, the image must be 906 pixels wide. (115mm is 4.53 inches, which contains 906 pixels at 200 pixels per inch, aka 200 dpi.)
*	Try to keep JPG file sizes below 127KB: [Amazon Kindle may automatically downsample images above that](http://authoradventures.blogspot.com/2014/02/image-size-limit-increased-in-kindle.html), and it's better if you control the downsampling for quality than let their servers do it. However, for raster-only images (e.g. x-rays or photos) if a larger size is required for acceptable print quality then larger is fine.

#### Image styles

We like these approaches to artwork, where possible:

*	Default style: Black and white line art, with average 1mm line thickness.
*	Use shades of grey only where needed, and as few shades as possible.
*	Use the same font and size for all labels. (We like [Source Sans Pro](https://www.google.com/fonts/specimen/Source+Sans+Pro) at 10pt on 115mm-wide images, 11pt on 145mm-wide images (see note above on using Illustrator).
*	Fit artboards to artwork bounds; there must be no white space around the art in an image. (We control space with styling.) Since you're creating images to a specific size, you need to **expand artwork to fit the artboard**, *not* fit artboards to artwork bounds, which would make your whole image smaller.

If you use live trace to create art from a raster source, you must clean up the file to remove unnecessary fills that add to file size but do little for clarity.

Settings:

*	Default file format: SVG
*	Convert type to outlines (the alternative to embed and subset fonts doesn't work reliably in print output currently)
*	Raster elements embedded, not linked
*	Transparent background

Where images *must* be raster (e.g. x-rays, photos), they should follow the sizing constraints above and be saved as jpg (since Amazon Kindle only uses JPG or GIF, avoid PNG or other formats). Save as RGB.

Where labels are added to a raster image, the image should be saved as SVG with an embedded raster image. Labels and other text should *not* be rasterised.

If you're creating images from InDesign originals using Illustrator, a suggested workflow:

*	If the image was created in InDesign (e.g. a flowchart made of InDesign frames): open in InDesign, group the frames that make up the image, copy, and paste into a new Illustrator file. Adjust Illustrator file artboards as necessary, then save as SVG.
*	If the image was created in Photoshop or other raster format: open the original, copy into Illustrator. Live trace the image. I mostly used the 'Detailed Illustration' preset. Save as SVG.
*	For filenaming, use the convention 1-2.svg, as in chapter-figure.svg. For skills workshops images, that might be 1E-B.svg for workshop 1E, figure B. All the images go in an images folder inside the folder with the markdown files.
*	If you save SVG from Adobe Illustrator (and possibly other creators, too), choose to convert type to outlines. Currently, PrinceXML does not support fonts in type in SVG reliably.
*	To save a little more on file size, also convert all strokes to fills.

#### Image file sizes

If you SVGs seem big, [read up on optimising SVGs](http://stackoverflow.com/a/7068651/1781075), and/or (if you're comfortable using Python scripts) run your SVGs through [Scour](http://codedread.com/scour/).

### Cover images

Add the front-cover image to the book's `images` folder. Ensure colour settings are RGB and the DPI is set to 72. We recommend creating the image in three sizes:

*	`cover.jpg`: 960px high (in keeping with epub best practice these are just under 1000px on their longest side)
*	`cover-thumb.jpg`: 300px wide
*	`cover-large.jpg`: 2000px high

The first is mandatory. The thumbnail and large images are for your convenience. For instance, when uploading a book to Amazon Kindle, you must provide a cover image this large.

### Embedding video

You can include any iframe in markdown to embed a video. We've created a simple way to embed YouTube videos and have them look consistent across your web version.

*	Find the video's YouTube ID: a code in the URL that looks like this: `RRV-9Jf0eI0`
*	In the markdown, put the code between these two tags: `{% include youtube-start.html %}` and `{% include youtube-end.html %}`. Those tags will insert the iframe HTML that works best for the Learning Station.
*	Our default iframe code gives the iframe a `.non-printing` class, so that the video won't appear in the printed or PDF book.
*	If you need a heading, caption or any other text related to the video, remember to add `{:.non-printing}` to them, so that they also do not appear in the book.

Here's a full example:

~~~
## A video
{:.non-printing}

{% include youtube-start.html %}RRV-9Jf0eI0{% include youtube-end.html %}
~~~

Note that this only works with YouTube. If you're embedding from any other service, instead of using our `{% include %}` tags:

*	use their standard embed iframe
*	try to select a width of around 850 px
*	add `style="max-width: 100%;"` and `class="non-printing"` to the iframe tag.

### Footnotes, endnotes and sidenotes

Our framework provides three options for notes.

**Footnotes** appear at the end of a document (web page or book chapter). In book parlance, they are therefore actually endnotes, but we call them footnotes because that's what kramdown calls them. To create them in markdown, follow the [kramdown syntax for footnotes](http://kramdown.gettalong.org/syntax.html#footnotes): 

*	put a `[^1]` where the footnote reference should appear (the `1` there can be any numbers or letters, and should be different for each footnote in a document);
*	anywhere in the document (we recommend after the paragraph containing the footnote reference), put `[^1]: Your footnote text here.`.

**Sidenotes** appear in a box to the right of the text. On wide screens, they float far right of the text. On narrower screens, the text wraps around them. In print, the text wraps around them, too. To create a sidenote, put a `*` at the start of the sidenote text and `*{:.sidenote}` at the end (with no spaces). (Technically, you're creating an `<em>` span with a kramdown IAL.)

In print, you can put **sidenotes at the bottom of the page**. By adding `.bottom` to the `{:.sidenote}` tag, your sidenote sits at the bottom of the page rather than on the right with text wrap. So the markdown looks like this: `*This is a sidenote at the bottom of the page in print.*{:.sidenote .bottom}`. On screen, these are just regular sidenotes.

### Stylesheets

We've provided generic stylesheets in the framework, but any given project will probably need its own styling for one reason or another. The main stylesheets are:

*	`screen.css` for the web version
*	`print.css` for PDF output with Prince.

Unless you are radically changing the design of your book, we recommend not editing these two files. To override only a few values or elements, rather create a child stylesheet containing only your new styling rules. 

To create a child stylesheet of `screen.css`, create the file, save it in the repo's `css` folder, and add its filename to the book's path's values in `_config.yml`. (Our template includes an example to follow.)

To create a child stylesheet to `print.css`, create the file and save it to the repo's `css` folder. Then when you create a PDF in Prince, apply both `print.css` and your child stylesheet, in that order.

Glance through our stylesheets to see what's useful, especially in `print.css`. For instance, you can add `keep-together`, `keep-with-next` and `page-break-before` classes to elements like lists and paragraphs. And you'd put `{:.keep-together}` in the line immediately after a paragraph to stop it breaking over two pages or columns. Use the class `non-printing` for elements that should only appear on screen versions of your book, but not in the printed book (like buttons or video embeds). Our stylesheets will hide them from Prince output (with `display: none;`).

## Trial-and-error tips

We've learned some stuff the hard way:

### Using Jekyll and GitHub:

*	When running Jekyll locally, and *if* your repo is a project using GitHub Pages (not an organisation or user site), you'll need to add `--baseurl ''` when running Jekyll at the command line. [Here's how and why](http://jekyllrb.com/docs/github-pages/#project-page-url-structure).
*	You may get different results between a local Jekyll install and GitHub Pages, even if both are using kramdown. Always check (at least spot check) both places.
*	Do not use a colon `:` in the title you include in your YAML header (inside the `---`s at the tops of files). For instance, you can't have `title: Beans: The musical fruit`. Jekyll will break, unsure if you're trying to map a second value to the YAML key. You'll have to do something like `title: Beans—The musical fruit`.
*	We recommend setting `.gitignore` to ignore the `_site` folder, where Jekyll will store HTML output locally. If you choose *not* to `.gitignore` your `_site` folder, it'll contain (and sync to GitHub) your local machine's most recent Jekyll HTML output. (The `_site` folder has nothing to do with what GitHub Pages publishes.) In theory, committing the `_site` folder makes it easy for collaborators without Jekyll to grab a book's output HTML from the repo. But it comes with problems: committers have a responsibility to make sure their Jekyll instance does a good job, and that their `_site` output is up-to-date with the latest changes to the underlying markdown. Importantly, if you have more than one committer on a book, you'll get lots of merge conflicts in the `_site` folder, and this will make your head hurt. (We let `_site` sync to GitHub for this template repo so that it includes our example output for reference.)

### Markdown tricks and quirks:

*	In lists, kramdown lets you use a space *or* a tab between the list marker (e.g. `*` or `1.` etc.) and the list text. If only to solve an issue with nesting blockquotes in lists, *use a tab* between the list marker and the start of the list text, and the same tab at the start of the blockquote line. That is, the indentation (the tab) must be exactly the same for the blockquote to nest correctly in the list. (A local Jekyll instance may correctly parse nested lists even with a space after the list marker and a tab before the blockquote `>`. But GitHub Pages is much stricter and requires exactly the same indentation.) E.g. see our book [Newborn Care 12-5](http://electricbookworks.github.io/bettercare/newborn-care/12.html#how-can-you-prevent-infection-in-newborn-infants).
*	Keep spans within block elements. For instance, if you have two paragraphs in italic, don't start the italics with `*` in the first paragraph and end the span with a second `*` in the next paragraph. The HTML needs one span (e.g. `<em>` span) in the first para, and another in the second para. The converter isn't smart enough to split your intended italics into two spans. Rather end the first span in the first para, and start another one in the second.

### File naming

Name each book's markdown files in perfectly alphabetical order. We recommend using a numbering system, where prelims (frontmatter) files start with a 0, e.g. `0-1-titlepage.md`, `0-2-copyright.md`, and chapter files are numbered for their chapter number, e.g. `1.md`, `2.md`, and so on. The alphabetical order makes it easy to see the documents in the right order at all times, and it makes ordering outputted HTML files easy when dropping them into Prince for PDF output.

## PDF output for print

We use [PrinceXML](http://princexml.com/) to turn Jekyll's HTML into beautiful, print-ready book files. We haven't found anything as good as Prince, so we reckon it's worth its price tag. And you can use the trial version to get your print output perfect before committing to the price. So our framework's CSS files for printing are designed specifically for Prince.

### Creating PDF files with the Prince GUI

1.	Find your book's HTML files in your `_site` folder. (Remember to run Jekyll locally to generate the latest version; if you're getting your HTML from a GitHub repo's `_site` folder, trust that the last contributor synced up-to-date, reliable HTML generated by their local Jekyll instance.)
2.	Drag the HTML files into Prince. Make sure they're in the right order. Only include the files you need in print. For instance, you'll usually leave out `index.html`. You'll usually only include `cover.html` when creating a PDF ebook.
3.	Tick ‘Merge all…’ and **specify an output file** location and name. Do not let Prince output to your `_site` folder. (If you skip this, Prince will output to your `_site` folder, which will cause permissions issues when you want to modify or delete the file, because Jekyll owns the `_site` folder and can overwrite it, and because Git will try to commit and sync the output PDF, which you probably don't want.)
4.	Drag the CSS file for your print output into Prince. By default in our book-framework, this is `print.css`, which produces a standard paperback-size document with crop marks for and bleed for professional printing. Then add any of these CSS files, after `print.css`, for additional options:
	*	`print-a4.css` overrides the page size and sets it to A4 (portrait);
	*	`print-a5.css` overrides the page size and sets it to A5 (portrait);
	*	`print-no-crop-marks.css` removes the crop marks, but leaves the bleed as is;
	*	`print-no-bleed.css` removes the bleed, and any crop marks with it.
5.	Click Convert.

Note: the links to CSS in our output HTML `<head>` *deliberately* break the link to `screen.css` when using Prince, so that you don't get screen styles in your print output. You can ignore error messages from Prince saying it can't find `screen.css`.

### Managing hyphenation in Prince

Our default stylesheets ask Prince to hyphenate paragraphs and lists (`p, ul, ol, dl`), with a few exceptions (such as text on the title and contents pages). Prince includes a range of hyphenation dictionaries by default, which do a good job. However, you might need to add dictionaries or lists of specific words that Prince doesn't support. You can find `.dic` files online for various languages and specialities, or you can compile your own.

We provide a blank `.dic` file for you to add your own list of hyphenation rules to. It is at `css/dictionaries/hyph.dic`. Our `print.css` asks Prince to look here when hyphenating.

A `.dic` file is a plain-text file with one word or word-fragment on each line. Each one is called a pattern.

*	If the pattern starts with a `.`, it will apply to, or match, any word that starts with that pattern. E.g. `.foo` will match the words 'food' and 'foobar' but not 'fastfood'.
*	If the pattern ends with a `.`, it will apply to any word that ends with that pattern. E.g. `port.` will match 'port' and 'sport' but not 'portico'.
*	Thus, if the pattern starts *and* ends with a `.`, it will apply to only that pattern exactly. E.g. `.port.` will only ever match 'port'.

To show where a word or word-fragment can hyphenate, you add digits (1 to 9) to the pattern. The digits have special meanings:

*	Insert odd digits (1, 3, 5, 7, 9) where the word may hyphenate.
*	Insert even digits (2, 4, 6, 8) where the word should not hyphenate.
*	The higher the number, the more important the rule. That is, a `1` says 'hyphenate here if you must', but a `9` says 'this is the best place to hyphenate'. A 2 says 'don't hyphenate here if you can help it', but an `8` says 'Do not, not, not hyphenate here.'

For user discussion, see [the Prince forums here](http://www.princexml.com/forum/topic/542/prince-hyphenate-patterns-none-url-patterns-url): If you need to hack Prince's built-in hyphenation dictionaries more deeply, see [this forum post](http://www.princexml.com/forum/topic/1474/prince-and-hyphenation).

## Epub output

We like to assemble our epubs (as EPUB2 for compatibility with older ereaders) in [Sigil](https://github.com/user-none/Sigil/). If we're not changing something major, it takes five minutes.

1.	Put the HTML files from `_site` into your `Text` folder.
1.	Put the framework's `epub.css` in your `Styles` folder.
1.	Replace the links to `screen.css` in your `<head>` elements with links to `epub.css`.
1.	Copy any fonts into the `Fonts` folder, if you want them embedded. (If you don't want to embed fonts, remove `@font-face` rules from your stylesheet to avoid file-not-found validation errors.)
1.	Search-and-replace to remove the `nav-bar` div (the link to `/` won't validate in an epub because it's not reachable). To find the nav-bar div in Sigil, use this DotAll Regex search: `(?s).<div class="non-printing" id="nav-bar">(.*)<!--#nav-bar-->`.
1.	Add basic metadata and semantics to your epub using Sigil's tools for this.
1.	Generate an epub table of contents using Sigil's TOC tools.
1.	Check that the cover works, using your own cover-image jpg. For info on improving your epub cover layout, see the `cover.xhtml` and cover CSS snippets [on our Knowledge Base](http://electricbookworks.com/kb/creating-epub-from-indesign/after-indesign-export-to-epub/add-a-cover/). (We've already added the relevant cover CSS snippets to `epub.css`.)

For general guidance on creating epubs with Sigil, check out [our training material](http://electricbookworks.github.io/ebw-training/) and the [Sigil user guide](https://github.com/Sigil-Ebook/Sigil/tree/master/docs).
