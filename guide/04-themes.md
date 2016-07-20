---
title: Themes
---

# Themes
{:.no_toc}

Our template includes one default design, or theme, which we called 'Classic'. This theme is a set of stylesheets for the three main output formats: the web (`web.css`), ebooks (`epub.css`) and print (`print.css`).

A theme is made of component parts:

* variables like default fonts and page size
* book elements like running heads and boxes.

It can also contain hyphenation dictionaries and Javascript.

You set your series variables and choose which components to include in the theme's master Sass stylesheets: `web.scss`, `print.scss` and `epub.scss` files. These are like config files for the theme.

When Jekyll builds your book, it will read these Sass files and automatically assemble finished CSS.
