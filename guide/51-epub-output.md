---
title: Epub output
---

# Epub output
{:.no_toc}

* toc
{:toc}

## Assembling the epub

We like to assemble our epubs (as EPUB2 for compatibility with older ereaders) in [Sigil](https://github.com/user-none/Sigil/). If we're not changing something major, it takes five minutes. (See the pro tip below for an even quicker way.)

1.	Put the HTML files from `_site` into your `Text` folder.
1.	Put the finished `epub.css` (from `_site/css`) into your Sigil `Styles` folder. (The `epub.css` file is a trimmed version of `screen.css`. It does not link to font files and avoids CSS3 features, like @fontface, some pseudo classes and media queries, to work better with popular readers with poor or buggy CSS support, such as Adobe Digital Editions.)
1.	If your book has a child stylesheet, add that, too.
1.	Replace any SVG images in the `Images` folder with JPG equivalents. And:
1.	Search-and-replace any links to .svg in your HTML files with .jpg.
1.	Replace the links to `screen.css` in your `<head>` elements with links to `epub.css`.
1.	Remove the link to the print CSS in your `<head>` elements.
1.	Copy any fonts into the `Fonts` folder, if you want them embedded. (If you don't want to embed fonts, remove any `@font-face` rules from your stylesheet to avoid file-not-found validation errors. We don't recommend embedding fonts unless they are required for meaning or unusual character sets.)
1.	Search-and-replace to remove the `nav-bar` div (the link to `/` won't validate in an epub because it's not reachable). To find the nav-bar div in Sigil, use this DotAll Regex search:

	~~~
	(?s).<div class="non-printing" id="nav-bar">(.*)<!--#nav-bar-->
	~~~

	(You may need to reverse the order of the class and id attributes.)

1.	Search-and-replace to remove the `footer` div (it's unnecessary in an ebook, and its links may break anyway). To remove the footer div in Sigil, use this DotAll Regex search and replace with nothing:

	~~~
	(?s).<div class="non-printing" id="footer">(.*)<!--#footer-->
	~~~

1.	Remove videos in iframes (iframes are invalid in EPUB2 XHTML 1.1). We recommend replacing videos with a link to an online version, e.g. to a YouTube page. This is best done manually. Search for `videowrapper` to find instances of embedded videos. The DotAll regex for finding the video wrapper is:

	~~~
	(?s).<div class="videowrapper non-printing">(.*)</div><!--.videowrapper-->
	~~~
	To **replace** the standard video wrapper with a link to the video:

	*	Search (with DotAll regex) for:

		~~~
		(?s).<div class="videowrapper non-printing">(.*)src="(.*?)"(.*)</div>(.*?)<!--.videowrapper-->
		~~~

		This will find the videowrapper and store the URL of the embedded video in memory.

	*	Replace with

		~~~
		<a href="\2" class="button">Watch</a>
		~~~

		This will replace the entire wrapper with a link to the same iframe URL it memorised (at `\2`). Replace `Watch` with whatever phrase you want to be the clickable text.
1.  If your book includes endnotes (kramdown footnotes), replace `fnref:` with `fnref-` and `fn:` with `fn-`. ( Background: If you have a colon in any element ID – for instance if you've used [kramdown's footnote syntax](http://kramdown.gettalong.org/quickref.html#footnotes) – EpubCheck will return an 'invalid NCName' error. You need to replace those colons with another character. If your invalid IDs follow a set pattern (as kramdown's footnote references do), you can replace-all quickly.)
1.	Add basic metadata to your epub using Sigil's Metadata Editor. Include at least:
	*	title: subtitle
	*	author
	*	date of creation
	*	publisher
	*	ISBN (or other identifier like a [UUID](https://www.uuidgenerator.net/))
	*	Relation ISBN (if any; we use the print ISBN as a parent ISBN)
1.	Add semantics (right click the file name in Sigil for the semantics context menu) to:
	*	key HTML files
	*	the cover JPG.
1.	Generate the epub's table of contents (Tools > Table Of Contents…).
1.	Check that the cover works, using your own cover-image jpg. For info on improving your epub cover layout, see the `cover.xhtml` and cover CSS snippets [on our Knowledge Base](http://electricbookworks.com/kb/creating-epub-from-indesign/after-indesign-export-to-epub/add-a-cover/). (We've already added the relevant cover CSS snippets to `epub.css`.)
1.	Validate the epub in Sigil and fix any validation errors. Sigil let's some things past that EpubCheck flags, so also validate with EpubCheck directly. You can use:
	*	the [IDPF's online version of EpubCheck](http://validator.idpf.org/)
	*	[epubcheck](https://github.com/IDPF/epubcheck/wiki/Running) installed locally, and run from the command line; or
	*	[pagina EPUB-Checker](http://www.pagina-online.de/produkte/epub-checker/).

For general guidance on creating epubs with Sigil, check out [EBW's training material](http://electricbookworks.github.io/ebw-training/) and the [Sigil user guide](https://github.com/Sigil-Ebook/Sigil/tree/master/docs).

### Quicker epub output

Our template includes a Jekyll layout specifically for creating epubs. To use it, change the default `layout` in `_config.yml` (globally or for a given book's folder path) to `epub`. We include both options, and comment one of them out. So just switch which one is commented out:

~~~
layout: "epub"
#layout: "default"
~~~

Remember to restart Jekyll after changing `_config.yml` for changes to take effect, and change it back to `default` afterwards (`default` is necessary for print and web output).

The `epub` layout lets you skip a few of the steps listed above, because it:

* links to the epub CSS you specify in `_config.yml` (using Sigil's standard `../Styles/` path)
* omits the nav bar and footer (no need to search and replace these)
* includes required epub metadata (if you've included it in your `_config.yml` file).

To get the metadata to import to Sigil, you must *open* one of your book's HTML files in Sigil (the cover is best, since it's the first file). That is, don't 'Add Existing Files…' to a new, blank epub. Only by opening a single HTML file (as in 'File > Open…', then select the HTML file) will Sigil read and import the file's Dublin Core metadata. After that, you can add the remaining files in Sigil using 'Add Existing Files…'.

### Splitting large files

If you have very large text files that, in the epub output, you'd like to split up into separate HTML files, Sigil can help. Using this tag in HTML, you can mark where Sigil must split your HTML file(s):

~~~
<hr class="sigil_split_marker" />
~~~

To create that in kramdown:

~~~
***
{:.sigil_split_marker}
~~~

Then, when you're assembling the epub in Sigil, just run Edit > Split at markers.

A common use case for this is books with end-of-book endnotes. To create end-of-book endnotes using kramdown footnotes you must put all content with endnotes in one markdown (and therefore HTML) file. This file is too large for sensible epub use, so splitting is important. Sigil is smart enough to update your internal links when you run 'Split at markers'.

Note, however, internal links in some files (e.g. your contents page) may not update in Sigil. (This may be a bug.) To update internal links, before running 'Split at markers', temporarily paste your contents-page list of links into your text file to be split. If the list is part of the same file, the links will update. You can then cut-and-paste the list back into your contents page.

## Mobi conversion

If you need a MOBI file for Kindle, we recommend putting your EPUB into [Kindlegen](http://www.amazon.com/gp/feature.html?docId=1000765211). If you don't want to use the command-line, just open the EPUB with the [Kindle Previewer](http://www.amazon.com/gp/feature.html?docId=1000765261), which automatically converts to MOBI using Kindlegen and saves the MOBI file to a folder beside your EPUB.

If Kindlegen cannot convert the EPUB, we've found that adding it to [Calibre](http://calibre-ebook.com/) first, then (without converting) give Calibre's version to Kindlegen.

Calibre gives you greater control over specific ebook conversions, but we've found Kindlegen converts some CSS better (e.g. floats and borders).
