---
title: Images
---

# Images
{:.no_toc}

* toc
{:toc}

## Adding images in markdown

We use standard markdown to embed images:

~~~
![The image alt text](images/filename.svg)
~~~

Most of our images are figures. That is, they include an image followed by a caption. We put these together in a `<blockquote>` element with a `.figure` class. We can then control placement by styling the `<blockquote>`.

The reason we use a blockquote is that it lets us keep images and their captions together. A `<figure>` element would be better HTML, but it won't validate in EPUB2, and can't be created with kramdown.

Here's an example of markdown for a figure:

~~~
> ![Figure 2-A: The Ballard scoring method](images/fig-2-A.svg)
>
> Figure 2-A: The Ballard scoring method
{:.figure}
~~~

Every line (except the `{:.figure}` class tag at the end) starts with a `>` and a space. These wrap the figure (image and caption) in a `blockquote` element.

The first line is the image reference. It consists of:

*	an exclamation mark telling markdown that we're placing an image
*	the `alt` attribute in square brackets
*	the path to the image file.

The third line is the figure caption, followed by the kramdown tag `{:.figure}`, which lets our stylesheets format the `blockquote` as a figure. (For instance, preventing a page break between the image and the caption in print.)

If your image has no caption, just skip the empty line and caption line:

~~~
> ![Figure 2-A: The Ballard scoring method](images/fig-2-A.svg)
{:.figure}
~~~

If it's important to you that the image isn't in a blockquote, and there is no caption, you can use:

~~~
![Figure 2-A: The Ballard scoring method](images/fig-2-A.svg)
{:.figure}
~~~

Always check print output (putting the HTML Jekyll creates through Prince with `print.css`) to be sure you're getting what you intend.

## Image placement

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
