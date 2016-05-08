---
title: Setting up
---

# Setting up
{:.no_toc}

* toc
{:toc}

## Technical overview

To set up the workflow, you still have to have some technical expertise. Once it's set up, non-technical editorial team members with a couple of hours training (taught or self-taught) can add and edit books in it.

The technical team members who run the workflow need to be familiar with a few concepts and tools:

*	**HTML and CSS**: the fundamental building blocks of almost all digital content.
*	**Markdown**: a simple, plain-text shortcut for creating HTML. (The original [Markdown syntax reference](http://daringfireball.net/projects/markdown/syntax) is the easiest intro to basic markdown. We use a markdown variant called [kramdown](http://kramdown.gettalong.org), because it's GitHub's default and it supports attributes like classes.)
*   **Sass**: a way to create complex CSS from simple rules.
*	**Jekyll**: software that turns markdown and Sass into HTML and CSS. (To learn about Jekyll, [start here](http://jekyllrb.com/). If you're installing it on Windows, [you'll also need this guide](http://jekyll-windows.juthilo.com/).)
*	**Git**: software for tracking a team's changes and syncing them with a remote server. We like to use [GitHub](http://github.com) and [Bitbucket](http://bitbucket.org) as our remotes.
*	**Sigil**: an open-source epub editor, where we quickly assemble ebooks.
*   **PrinceXML**: an app for creating PDFs from HTML and CSS (Prince is the only proprietary part of this stack).

> ## Example: Bettercare
> 
> Bettercare publishes nursing textbooks. The team uses the workflow to keep a book's master content in markdown files, structured for Jekyll, on GitHub. For instance, Bettercare's books are stored here: [https://github.com/bettercarehealth/bettercare](https://github.com/bettercarehealth/bettercare)
> 
> > Note: Bettercare is a great example of a big publishing project using the workflow. However, since it was our first full implementation, it uses an early, outdated version of the workflow.
> {:.box}
> 
> The workflow uses the [kramdown syntax](http://kramdown.gettalong.org/) for markdown, in part because that's what GitHub uses and largely because it has specific features we need, such as classes (with 'inline attribute lists' or IALs).
> 
> For Bettercare's open-source books, we let GitHub Pages publish the static HTML output, which it does automatically, also with Jekyll. For instance, our staging site for Bettercare content is here: [http://bettercarehealth.github.io/bettercare/](http://bettercarehealth.github.io/bettercare/)
> 
> Bettercare then copies the output HTML to a [separate, production site](http://ls.bettercare.co.za).
> 
> When we use this workflow for closed content, we don't use GitHub Pages, and store the content in private GitHub or Bitbucket repos instead.
> 
> If you click through to a book chapter available on the web, you'll see the HTML we get from kramdown is very neat. For example, view source here: [http://bettercarehealth.github.io/bettercare/nc/nc-1.html](http://bettercarehealth.github.io/bettercare/nc/nc-1.html)
> 
> The key to simple HTML is in carefully [mapping a book's features](http://electricbookworks.com/kb/creating-epub-from-indesign/mapping-book-features-to-html-elements-and-classes/) to ordinary HTML elements. That way, we need only a few classes, and can easily use the same HTML with simple stylesheets for the web, apps, epub, and print output. And our HTML content remains readable in readers and low-bandwidth browsers with low CSS support. 
> 
> Finally, to turn our HTML into print PDFs, we use [PrinceXML](http://princexml.com). And we use Sigil to put our HTML into EPUB2-valid epubs. This way, we can create print PDFs or epubs in a  matter of minutes.

## Folder (repo) structure

A workflow folder (often tracked in Git as a repo) usually contains a series of related books. Its folders and files follow the [standard Jekyll structure](http://jekyllrb.com/docs/structure/): in the root are `_include`, `_layouts` and `css` folders, and `_config.yml` and `index` files. We then put each book's content in its own folder.

> Pro tip: You could also store several series in one repo, each series with its own set of Jekyll files, and a single `_prose.yml` configuration in the root folder for all series subfolders. This is only useful if you don't need a live staging site or previews with GitHub Pages, since each Jekyll setup must be in its own repo for GitHub Pages to work out of the box.
{:.box}

## Using the template

The `template` folder is a ready-to-use workflow folder for making books. In the `template` folder, there are several folders and files:

*   `book`: book content files
*   `css`: book design files
*   `_includes`: snippets of HTML for Jekyll (you won't have to open this folder)
*   `_layouts`: instructions to Jekyll on how to assemble those snippets (no need to open this either)
*   `_data`: files containing book metadata
*   `_config.yml`: a file for setting configuration options for your collection of books
*   `_prose.yml`: configuration settings for using [prose.io](http://prose.io) for online book editing (generally, you won't have to edit this)
*   `index.md`: content for the home page of your collection when served as a website.

The `book` folder is an example book with a minimum number of sample files in it. 

The files in the `css` folder handle the design of your books. It contains a theme that we call 'Classic'. A theme is a collection of CSS (Sass, technically) files that define a book's design. We hope that in future we and others might design other themes, though Classic is extremely versatile already. For most book design, you'll only have to edit the variables in your own copies of `print.scss`, `web.scss` and `epub.scss`.

> Technical note: If you're familiar with Sass, you'll know that Jekyll's will convert these `.scss` files into finished `.css` files. Sass, saved in `.scss` files, is to CSS what markdown is to HTML: an efficient way to write that lets software do the hard work of creating finished code.
{:.box}

## Creating a new book

To create a new book in a new series:

1. The `template` folder can hold one book or many, like a collection of books that share similar metadata or features (e.g. they're all by the same publisher). Make a copy of `template` and rename it for your collection. E.g. `my-sci-fi`.
1.  Rename the `book` folder with a short folder-name version of your book's title. Use only lowercase letters and no spaces. If you're creating more than one book, make a copy of this folder for each one. Each book gets its own folder. The name of the folder is important: you will use this folder name as the book's 'slug', a sort of human-readable identifier within a series folder.
1.  Inside a book's folder, add a markdown file for each piece of your book, e.g. one file per chapter. Our template contains files we consider minimum requirements for most books: a cover, a title page, a copyright page, a contents page, and a text file.
1.  Inside each book's folder, store images in the `images` folder. Add a `cover.jpg` image of your book's front cover there, too.
1. In the `css` folder, make copies of `print.scss`, `web.scss` and `epub.scss` and rename them for each book (e.g. `print-space-potatoes.scss`).
1. Inside `my-sci-fi`, open and edit these three files:
    *   `_config.yml`: Edit the values there for your series. The comments will guide you.
    *   `index.md`: Replace our template text with your own. Usually, at least a link to each book is useful, e.g. `[Space Potatoes](space-potatoes)`.
    *   `README.md`: Replace our template text with any notes your collaborators might need to know about your series. (The README file is usually only read in the context of editing the files in your folder/repo.)
1.	In `_data`, make a copy of the `book.yml` file to edit. Give the file the same name as your book's slug. In this example, that would be `my-sci-fi.yml`. In that file, fill in as much metadata as you can. (Your markdown files and HTML snippets will draw on that metadata, using Liquid tags, when constructing your book.)

## Creating book content

Each markdown file in `my-sci-fi` is a part of a book, such as a table of contents or a chapter. In each file's YAML header (the info between `---`s at the top) we specify the book-part's `title` and the book-part's `style` to use for that part. The `style` specifies what kind of book-part it is, such as a `title-page` or `chapter`.

> Technical note: the `style` YAML sets the class attribute of the output HTML's `<body>` element. We use that class to control CSS and page structure.
{:.box}

When you create your book, we recommend following these conventions for file naming and `style` settings:

| Book section                | Sample file               | Style in YAML    |
|-----------------------------|---------------------------|------------------|
| Front cover (for the ebook) | `0-0-cover.md`            | `cover`          |
| Title page                  | `0-1-titlepage.md`        | `title-page`     |
| Copyright page              | `0-2-copyright.md`        | `copyright-page` |
| Table of contents           | `0-3-contents.md`         | `contents-page`  |
| Acknowledgements            | `0-4-acknowledgements.md` | `frontmatter`    |
| A first chapter             | `1.md`                    | `chapter`        |
| A second chapter            | `2.md`                    | `chapter`        |

If you don't set the `style`, the page will default to `style: chapter`. So you actually don't need to ever set `style: chapter` in a YAML header.

Page layouts we've designed for in the Classic theme include:

*	`index` for the home page of a collection
*	`cover` for a front cover, which will appear in ebook editions
*	`halftitle-page` for a book's halftitle page
*	`previous-publications-page` for a book's list of the author's previous publications
*	`title-page` for a book's title page
*	`copyright-page` for the copyright or imprint page
*	`contents-page` for the book's table of contents
*	`dedication-page` for a dedication page
*	`epigraph-page` for an epigraph page
*	`frontispiece-page` for a frontispiece page
*	`frontmatter` for other prelim pages not accounted for otherwise
*	`chapter` for a book's default chapter page (and the global default)

You can also invent your own page styles, and use them in your custom CSS instead of these, though you may get unexpected results if you've been relying on CSS for existing styles like `chapter`.

> Tip: If, in your web output, you don't want the navigation (nav bar and footer) on a page, such as the collection's index page, add `layout: min` to the document's YAML header. The `min` layout does not include a nav-bar and footer.
{:.box}

### Set first pages

Many books have two 'page ones': 

1.	the half-title or title page and, 
2.	if the prelims have roman-numeral page numbers, the first chapter.

You should specify those pages so that Prince knows where to start numbering.

Why? Well, for example, in print output if you use `frontmatter` on a book-part, by default it will have roman-numeral page numbers. When the first `chapter` starts, it will have decimal page numbers. However, the page numbering will be consecutive from roman through decimal. That is, it will run 'ix, x, 11, 12'. You reset the numbering to 1 at the start of the first `chapter` to avoid this.

You reset page numbering by adding the class `page-1` to the first block-level element on the relevant page.

You can do this in two ways:

1.	If a markdown document starts at 'page one', add the class to the `style` YAML header. E.g.

	~~~
	---
	title: Half-title page
	style: halftitle-page page-1
	---
	~~~

	And at the first chapter:

	~~~
	---
	title: Chapter One
	style: chapter page-1
	---
	~~~

	Remember that `chapter` is the default, so you normally don't have to specify it. *But* if you want to *add* a class in addition to `chapter`, you must specify both classes. This is because, if you were to use `style: page-1` in a YAML header, the class `page-1` would override the default `style: chapter`, not add to it.

2.	Add the `page-1` class to the first block-level element in the chapter by adding the tag `{:.page-1}` in the line immediately after it. (Note: for this to work, the element must *not* have a CSS float applied to it.)

### File naming

Name each book's markdown files in perfectly alphabetical order. We recommend using a numbering system, where prelims (frontmatter) files start with a 0, e.g. `0-1-titlepage.md`, `0-2-copyright.md`, and chapter files are numbered for their chapter number, e.g. `01.md`, `02.md`, and so on. The alphabetical order makes it easy to see the documents in the right order at all times, and it makes ordering outputted HTML files easy when dropping them into Prince for PDF output.

> Note: We recommend using leading zeros in file-name numbers – that is, `02.md` rather than `2.md` – because that sorts correctly in most file browsers. Otherwise, some file browsers will sort `10.md` before `2.md`. In the rare event that you have over 99 chapters, use two leading zeros: `001.md`.
{:.box}

## The `images` folder

Alongside the content files in a book's folder is an `images` folder, for images that belong to that book only.

A book's folder should only ever need to contain markdown files and images. If you're embedding other kinds of media you could add folders for that alongside `images`. We don't recommend sharing images or media between books, in case you want to move a book from one repo to another later. (So, for example, copy the publisher logo into each book's `images` folder separately.)
