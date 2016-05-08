---
title: Themes and stylesheets
---

# Themes and stylesheets
{:.no_toc}

Our template includes one default design, or theme, which we called 'classic'. This theme is a set of stylesheets for the three main output formats: the web (`web.css`), ebooks (`epub.css`) and print (`print.css`).

A theme is made of component parts:

* variables like default fonts and page size
* book elements like running heads and boxes.

You set your series variables and choose which components to include in the Sass files in `/css`: `web.scss`, `print.scss` and `epub.scss`.

When Jekyll converts your markdown to HTML, it will read your Sass files and automatically assemble finished CSS.

To change stying for a specific book in a series, make a copy of the stylesheet(s) you need to change (`web.scss`, `print.scss` and/or `epub.scss`), and name it sensibly (e.g. `web-scifi.scss`).

Then add the file name(s) to that book's details in `_config.yml`. For instance, if you created a style for `web-scifi.scss` but will use the default print and epub styles for the book, you'll this line to your configuration for that book:

~~~
stylesheet-web: "web-scifi.css"
~~~
