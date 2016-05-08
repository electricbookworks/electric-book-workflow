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
1.	{:#adding-the-epub-toc}Generate the epub's table of contents (Tools > Table Of Contents…). This TOC is generated only from the headings (`h1` to `h6`) in the text. So it does not include the cover, which has no heading, or any other files without a heading (e.g. sometimes the copyright page). If you need to add a cover to the TOC:
	1. Go to Tools > Table Of Contents > Edit Table Of Contents… 
	2. Click on the first entry in the TOC list.
	3. Click 'Add Above'.
	4. Click 'Select Target' and select the cover HTML file (usually `0-0-cover.html`).
	5. In the blank space under 'TOC Entry', double-click and type 'Cover'.
	6. Click Okay.
	7. Use the same process for adding any other files you need to add to the TOC.
1.	If fonts are important (you've either embedded fonts or the difference between serif and sans-serif is semantically significant), add iBooks XML. ([See below for detail](#adding-ibooks-display-options-file).)
1.	Check that the cover works, using your own cover-image jpg. For info on improving your epub cover layout, see the `cover.xhtml` and cover CSS snippets [on our Knowledge Base](http://electricbookworks.com/kb/creating-epub-from-indesign/after-indesign-export-to-epub/add-a-cover/). (We've already added the relevant cover CSS snippets to `epub.css`.)
1.	{:#validate-the-epub}Validate the epub in Sigil and fix any validation errors. Sigil let's some things past that EpubCheck flags, so also validate with EpubCheck directly. You can use:
	*	the [IDPF's online version of EpubCheck](http://validator.idpf.org/)
	*	[epubcheck](https://github.com/IDPF/epubcheck/wiki/Running) installed locally, and run from the command line; or
	*	[pagina EPUB-Checker](http://www.pagina-online.de/produkte/epub-checker/).

For general guidance on creating epubs with Sigil, check out [EBW's training material](http://electricbookworks.github.io/ebw-training/) and the [Sigil user guide](https://github.com/Sigil-Ebook/Sigil/tree/master/docs).

### Quicker epub output

Our template includes a Jekyll layout specifically for creating epubs. To use it, change the default `output` in `_config.yml` (globally or for a given book's folder path) to `epub`. We include both options, and comment one of them out. So just switch which one is commented out:

~~~
output: "epub"
#output: "default"
~~~

Remember to restart Jekyll after changing `_config.yml` for changes to take effect, and change it back to `default` afterwards (`default` is necessary for print and web output).

The `epub` output lets you skip a few of the steps listed above, because it:

* links to the epub CSS you specify in `_config.yml` (using Sigil's standard `../Styles/` path)
* omits the nav bar and footer (no need to search and replace these)
* includes required epub metadata (if you've included it in your `_config.yml` file).

To get the metadata to import to Sigil, you must *open* one of your book's HTML files in Sigil (the cover is best, since it's the first file). That is, don't 'Add Existing Files…' to a new, blank epub. Only by opening a single HTML file (as in 'File > Open…', then select the HTML file) will Sigil read and import the file's Dublin Core metadata. After that, you can add the remaining files in Sigil using 'Add Existing Files…'.

> Pro tip: you can avoid having to change your config file to `output: "epub"` by loading a second config file when you build or serve Jekyll at the command line. The second config file sets the `output`, overriding the default config. To do this, use:
> 
> `jekyll build --config _config.yml,_config.epub.yml`
> 
> We also provide a second config file for PDF ebook output:
> 
> `jekyll build --config _config.yml,_config.pdf-ebook.yml`

#### Quick-epub process checklist

If you've generated HTML using the `output: epub` setting in `_config.yml`, your basic process in Sigil is as follows. 

1.	File > Open… and select the first HTML file in `_site/yourbook`.
2.	Right-click the Text folder > Add Existing Files… and select the remaining HTML files for the epub.
3.	Right-click the Text or Styles folder > Add Existing Files… and select the epub's CSS file in `_site/css`.
4.	Tools > Table Of Contents > Generate Table Of Contents
5.	Add file semantics (right-click HTML files > Add Semantics… and right-click the cover jpg > Cover Image).
6.	Save, and [validate](#validate-the-epub) with the Flightcrew plugin and separately with EPUBCheck.

Depending on your needs, you may also need to:

*	search-and-replace ([as described above](#assembling-the-epub)) for SVG images, footnotes, or video;
*	add the cover (or other files) to your table of contents ([as described above](#adding-the-epub-toc))
*	add font files if you're embedding fonts;
*	split large files ([as described below](#splitting-large-files))
*	add the iBooks display-options XML ([as described below](#adding-ibooks-display-options-file)).

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

Also, remember to hide those markers in print output (and web and elsewhere as needed) with this in your CSS:

~~~
.sigil_split_marker {
	display: none;
}
~~~

Then, when you're assembling the epub in Sigil, just run Edit > Split At Markers.

Sigil will then split the HTML file into separate HTML files at the markers, and remove the `<hr>` element.

A common use case for this is books with end-of-book endnotes. To create end-of-book endnotes using kramdown footnotes you must put all content with endnotes in one markdown (and therefore HTML) file. This file is too large for sensible epub use, so splitting is important. Sigil is smart enough to update your internal links when you run 'Split At Markers'.

> **NB: Before running Split At Markers: save, close, and reopen your epub.** At least till Sigil 0.9.3, there is [an issue with updating internal links when using Split At Markers](http://www.mobileread.com/forums/showthread.php?p=3277498#post3277498). In order for internal links to update correctly, Sigil must *first* have rewritten all link paths to HTML files according to its `../Text/` folder structure (e.g. the links to chapters in a Table of Contents file). Sigil only rewrites all these paths when an epub file is opened. So to make sure links are udpated when running Split At Markers, you need to save, close, and reopen the epub first. This [may be fixed from Sigil 0.9.5](http://www.mobileread.com/forums/showpost.php?p=3277552&postcount=11).

## Mobi conversion

If you need a MOBI file for Kindle, we recommend putting your EPUB into the [Kindle Previewer](http://www.amazon.com/gp/feature.html?docId=1000765261), which automatically converts to MOBI using Kindlegen and saves the MOBI file to a folder beside your EPUB.

If Previewer cannot convert the EPUB, we've found that adding it to [Calibre](http://calibre-ebook.com/) first, then (without converting) give Calibre's version to Kindle Previewer. Calibre gives you greater control over specific ebook conversions, but we've found Kindle Previewer converts some CSS better (e.g. floats and borders).

> If you need to dig into a mobi file's code to troubleshoot, try the [KindleUnpack plugin for Calibre](http://www.mobileread.com/forums/showthread.php?t=171529).
{:.box}

## Adding iBooks display-options file

If you need to add the `com.apple.ibooks.display-options.xml` file to your epub for iBooks display options, you can use the [AddiBooksXML](http://www.mobileread.com/forums/showthread.php?t=272241) plugin in Sigil.

A very basic display-options file contains this XML:

~~~
<?xml version="1.0" encoding="UTF-8"?>
<display_options>
    <platform name="*">
        <option name="specified-fonts">true</option>
        <option name="interactive">false</option>
        <option name="fixed-layout">false</option>
        <option name="open-to-spread">false</option>
        <option name="orientation-lock">none</option>
    </platform>
</display_options>
~~~

The file should be in the epub's META-INF folder, which Sigil does not let you edit by default, hence the need for the plugin.

To install the plugin:

*	[Download the zip file](http://www.mobileread.com/forums/showthread.php?t=272241).
*	In Sigil, go to Plugins > Manage Plugins.
*	Click Add Plugin and locate and select the zip file you downloaded.

To use the plugin:

*	First, in a plain-text/code editor create an `com.apple.ibooks.display-options.xml` file containing only the XML shown above. If necessary, change the five options settings in it. Save the XML file with your source material for the book for future use/reference.
*	In Sigil, with the epub open, go to Plugins > Edit > AddiBooksXML and find and select the `com.apple.ibooks.display-options.xml` file you just created.
