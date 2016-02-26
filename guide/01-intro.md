---
title: Introduction
---

# Introduction
{:.no_toc title="Introduction" .page-1}

At [Electric Book Works](http://electricbookworks.com), we needed a system that is easy for non-technical people to edit books in, includes great version control, produces books fast (no InDesign layout except for cover design), and instantly produces HTML we can use for the web, ebooks, apps, and print. By print, we mean high-end books you buy in a store, not just 'save as PDF'. We didn't want to be locked into any proprietary tools, either: we needed to use open technologies to ensure our content was future-proof.

So we put this workflow together:

1.	We store a book's master files in plain text (formatted as [markdown](http://daringfireball.net/projects/markdown/syntax#philosophy)).
2.	We turn that plain text into clean HTML instantly (using [Jekyll](http://jekyllrb.com/)).
3.	We apply different stylesheets to that HTML to get beautiful web versions, ebooks and print PDFs in minutes (using [Sigil](http://sigil-ebook.com/) and [PrinceXML](http://www.princexml.com/)).

Markdown is so simple that non-technical people can learn how to create and edit it in under an hour. (They can even work directly on the master files online using [Prose](http://prose.io/).)

Jekyll is great at generating clean HTML in flexible ways, and has a big, active development community and committed project owners. Is also includes kramdown and Sass, which are critical to creating new book designs quickly.

While PrinceXML is proprietary software, it's our favourite implementation of the open standards for CSS Paged Media. You might also try [Antenna House](https://www.antennahouse.com/). And as more open-source tools (e.g. [WeasyPrint](http://weasyprint.org/)) support CSS Paged Media more fully, we'll have more options here.

## Alternatives

There are several digital-first book-publishing systems around.

Some are also based on markdown, like ours. For example:

*	[Gitbook IO](http://www.gitbook.io/)
*	[Penflip](http://www.penflip.com/)
*   [LeanPub](https://leanpub.com/) (which uses [Markua](http://markua.com/))
*	[Phil Schatz's viewer](http://philschatz.com/2014/07/07/tiny-book-reader).

[PressBooks](http://pressbooks.com/), which is built on Wordpress, is a superb, affordable service.

And if you're a serious publishing outfit, have a look at [O'Reilly Atlas](https://atlas.oreilly.com/).

[OERPub Editor](http://oerpub.org/tools/) is a web-based editor for non-technical people to create EPUB3 HTML that includes maths. As a Javascript editor it runs in the browser and saves content in EPUB3 structure to a GitHub repo. Neat.

For converting HTML/CSS to print PDF, we use PrinceXML, which is proprietary. Other alternatives, which we haven't tested or don't yet support all the page-layout features we need, include:

*	[Antenna House](https://www.antennahouse.com/) (proprietary, mature)
*	[WeasyPrint](http://weasyprint.org/) (open-source, in active development)
*	[Vivliostyle](https://github.com/vivliostyle/vivliostyle) (young, apparently open-source, but [also commercial](http://vivliostyle.com/en/))
*	[PDFReactor](http://www.pdfreactor.com/) (proprietary)
*	[DocRaptor](http://docraptor.com/) (a cloud-service implementation of PrinceXML)
