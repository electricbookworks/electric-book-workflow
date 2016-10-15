---
title: Images
---

# Images
{:.no_toc}

* toc
{:toc}

{% raw %}

## Adding images in markdown

We use standard markdown to embed images:

~~~
![A description of the image](../{{ site.image-set }}/filename.svg)
~~~

Let's break that down:

* the exclamation mark and square and round brackets make up the masic markdown image syntax: `![Description](filename)`. The description is especially important for screen-readers used by the visually impaired.
* `../` means 'go up, out of the `text` folder'
* `{{ site.image-set }}/` means 'go into the folder containing our preferred set of images' (as defined in `_config.yml`). The default image-set folder is `images`.
* finally, the image file name.

Many images are in figures. That is, they include an image followed by a caption. We put these together in a `<blockquote>` element with a `.figure` class. We can then control placement by styling the `<blockquote>`.

The reason we use a blockquote is that it lets us keep images and their captions together. A `<figure>` element would be better HTML, but it won't validate in EPUB2, and can't be created with kramdown.

Here's an example of markdown for a figure:

~~~
> ![Line drawing of a book](../{{ site.image-set }}/book.jpg)
>
> This is not a book.
{:.figure}
~~~

Every line (except the `{:.figure}` class tag at the end) starts with a `>` and a space. These wrap the figure (image and caption) in a `blockquote` element.

The first line is the image reference. As noted above, it consists of:

*	an exclamation mark telling markdown that we're placing an image
*	the `alt` attribute in square brackets
*	the path to the image file.

The third line is the figure caption, followed by the kramdown tag `{:.figure}`, which lets our stylesheets format the `blockquote` as a figure. (For instance, preventing a page break between the image and the caption in print.)

This will display like this.

{% endraw %}

> ![Line drawing of a book](../{{ site.image-set }}/book.jpg)
>
> This is not a book.
{:.figure}

{% raw %}

If your image has no caption, just skip the empty line and caption line:

~~~
> ![Figure 2-A: The Ballard scoring method](../{{ site.image-set }}/fig-2-A.svg)
{:.figure}
~~~

If it's important to you that the image isn't in a blockquote, and there is no caption, you can use:

~~~
![Figure 2-A: The Ballard scoring method](../{{ site.image-set }}/fig-2-A.svg)
{:.figure}
~~~

## Alternative image sets

There are often good reasons for producing books with different sets of images. For instance, one edition may have colour images and another black-and-white. Or your print edition might call for high-res images, but you want low-res ones for the ebook.

By default, your markdown looks for images in the book's `images` folder. You can set your config file to switch to an alternative set of images (in a subfolder of `images`) when needed. We do this by using the `{{ site.image-set }}` tag to refer to whatever images folder we need at the time.

For example:

~~~
![]({{ site.image-set }}/filename.jpg)
~~~

The default `image-set` is `images`. You can change that for each output as needed. For instance, you might create a subfolder for high-res images in `images` called `print`. In `_config.yml` you can set that subfolder as the default images folder. 

~~~
image-set: "images/hi-res"
~~~

Whenever you build your HTML, you then switch which set of images to use by commenting out the `image-set` setting(s) you don't want. For example, when creating the high-res edition, in `_config.yml` you might comment out the default image path so that the HTML uses the high-res images:

~~~
#image-set: "images"
image-set: "images/print"
~~~

Remember that your images in your alternative images folder must have exactly the same file names as your default image set. The HTML will be looking for the same file names in a different folder.

To always use a specific image file for any given image, irrespective of the `images-set` config, simply hard-code your image path in markdown – that is, without using the `{{ site.image-set }}` tag. For example, for a given image you might specify the default images folder `![](images/filename.jpg)` or a specific subfolder `![](images/nb/filename.jpg)`.

{% endraw %}

## Image placement

You may need to control how an image is sized and placed on the page – especially in print – depending on its detail or aspect ratio and nearby images or other elements. You do this by adding a class tag to the line following the image or figure created with a `>` blockquote. (This applies a class to the blockquote in HTML.) 

In the Classic theme, you have two broad options:

The lazy way: use these class attributes:

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

The more accurate way: use a class tag to specify the exact height of the image in lines. This is important if you're maintaining a baseline grid on your pages. For instance, `{:.height-5}` will limit the image to a height of five lines. Unlike the lazy way above, this tag should be applied to the image, not the figure. So a complete figure element might look like this in markdown:

~~~
> ![Potatoes on the moon]({{ site.image-set }}/1-moon-potatoes.jpg)
> {:.height-12}
>
> Potatoes grow well on the moon if well watered.
{:.figure}
~~~

> CSS tip: [If you're having trouble with SVGs having space around them](http://stackoverflow.com/questions/24626908/how-to-get-rid-of-extra-space-below-svg-in-div-element), in your CSS make sure you set the height of the `img` element. SVGs are inline elements by default, and will add white space around them.

## Preparing images

*   Wherever possible, convert images to SVG so that they scale beautifully but also remain small in file-size for web use.
*   Ensure that raster images, or raster/bitmap elements in SVG, are high-res enough for printing (e.g. 300dpi at full size).
*   Embed images placed in your SVG image, don't just link them.
*   Create a JPG version of every SVG image with the same file name (e.g. `bear.svg` and `bear.jpg`). You'll need the JPG fallback for EPUB. (We recommend JPG over GIF or PNG as a general default. One reason is that transparency seems like a good idea until your end-user switches their e-reader to 'night mode', and your black line-art disappears into the background.)
*   Save images in the book's `images` folder.

Here's our most common workflow for converting images to SVG:

*   If the image was created in InDesign (e.g. a flowchart made of InDesign frames): open in InDesign, group the frames that make up the image, copy, and paste into a new Illustrator file. Adjust Illustrator file artboards as necessary, then save as SVG.
*   If the image was created in Photoshop or other raster format: open the original, copy into Illustrator. Live trace the image. (We mostly use the 'Detailed Illustration' preset.) Save as SVG. You can also use the trace function in Inkscape instead of Illustrator.
*   If you save SVG from Adobe Illustrator (and possibly other creators, too), choose to convert type to outlines. (For us, the main reason for this is that PrinceXML gives unpredictable results with type in SVG. But it's probably safest generally to convert type to outlines for consistent output.)

### Recommended image sizes

We like to use these settings where possible:

*	Default width: 115mm
*	Aspect ratios: 4:3 (portrait or landscape), a closer ratio, or square. Images at wider ratios (e.g. 16:9) than 4:3 make layout more difficult.
*	Therefore, maximum height is 150mm. (That's very slightly less than a 4:3 height:width ratio.)

Using Illustrator? Different SVG editors treat image size differently. For instance, a 2-inch-wide image in Illustrator will appear 1.6 inches wide in Prince and Inkscape. Why? Because when creating the SVG's XML, Illustrator includes its dimensions in pixels, and *assumes a 72dpi resolution*, where Prince and Inkscape follow the W3C SVG spec and assume 90dpi. As a result, images coming out of Illustrator always appear 80% of their intended size. So, if you're creating images in Illustrator, set your image sizes to 125% of what you intend to appear in the book. That means:

*	default width 115mm × 125% = 143.75mm
*	max height (at 4:3) = 190mm

Check out [Adobe's guidance on saving SVGs](https://helpx.adobe.com/illustrator/using/saving-artwork.html#save_in_svg_format).

### Resolution

*	For SVG images, the editor you use will determine underlying resolution. Illustrator uses 72dpi, and Inkscape 90dpi. We favour and assume 90dpi, but can rescale SVG images with  our stylesheets just in case.
*	For JPGs, our default resolution should be 200dpi and image quality of 80 ('very high' in Adobe presets). This allows for reasonable print quality while keeping file sizes sensible for web delivery. The higher resolution also allows ebook users to zoom in for more detail.
*	To get a 200dpi JPG that is 115 mm wide, the image must be 906 pixels wide. (115mm is 4.53 inches, which contains 906 pixels at 200 pixels per inch, aka 200 dpi.)
*	Try to keep JPG file sizes below 127KB: [Amazon Kindle may automatically downsample images above that](http://authoradventures.blogspot.com/2014/02/image-size-limit-increased-in-kindle.html), and it's better if you control the downsampling for quality than let their servers do it. However, for raster-only images (e.g. x-rays or photos) if a larger size is required for acceptable print quality then larger is fine.

### Image styles

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

### Image file sizes

If you SVGs seem big, [read up on optimising SVGs](http://stackoverflow.com/a/7068651/1781075), and/or (if you're comfortable using Python scripts) run your SVGs through [Scour](http://codedread.com/scour/).

### Cover images

Add the front-cover image to the book's `images` folder. Ensure colour settings are RGB and the DPI is set to 72. We recommend creating the image in three sizes:

*	`cover.jpg`: 960px high (in keeping with epub best practice these are just under 1000px on their longest side)
*	`cover-thumb.jpg`: 300px wide
*	`cover-large.jpg`: 2000px high

The first is mandatory. The thumbnail and large images are for your convenience. For instance, when uploading a book to Amazon Kindle, you must provide a cover image this large.
