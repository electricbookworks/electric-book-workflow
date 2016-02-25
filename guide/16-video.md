---
title: Video
---

{% raw %}

# Embedding video

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


Note that this only works with YouTube. If you're embedding from any other service, instead of using our `include` tags:

*	use their standard embed iframe
*	try to select a width of around 850 px
*	add `style="max-width: 100%;"` and `class="non-printing"` to the iframe tag.

{% endraw %}
