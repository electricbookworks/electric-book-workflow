---
title: Supported classes
---

# Supported classes

Our Classic theme includes styling for a range of classes. You can apply these to elements in markdown.

| Feature | Workflow class | Block or inline |  Explanation | Supports edition suffix
| --- | --- | --- | --- | ---
| Bibliography list | `.bibliography` | Block | Styles a list as a bibliography, for instance at the end of an academic book. | No
| Box | `.box` | Block | Puts the element in a box, to set it off from the rest of the text. | No
| Chapter number | `.chapter-number` | Block | Used for a chapter number before a chapter heading. (See the tip at [Bold](#bold) above for another way to handle chapter numbers. | No
| Dedication | `.dedication` | Block | A dedication, for instance at the start of a book or chapter | No
| Epigraph source | `.epigraph-source` | Block | The person to whom the epigraph is attributed. | No
| Epigraph | `.epigraph` | Block | An epigraph at the start of a book or chapter. | No
| Figure | `.figure` | Block | A figure is an image with a caption. Read about how to manage them properly [in our workflow guide](https://github.com/electricbookworks/electric-book-workflow#adding-images-in-markdown). | No
| Figure: extra small | `.x-small` | Block | Add to the `.figure` tag, e.g. `{:.figure .x-small}`.  | No
| Figure: fixed position | `.fixed` | Block | Add to the `.figure` tag, e.g. `{:.figure .fixed}`. For figures that must keep their position in the text flow, and must not float to the top of the page. | No
| Figure: large | `.large` | Block | Add to the `.figure` tag, e.g. `{:.figure .large}`.  | No
| Figure: medium | `.medium` | Block | Add to the `.figure` tag, e.g. `{:.figure .medium}`.  | No
| Figure: small | `.small` | Block | Add to the `.figure` tag, e.g. `{:.figure .small}`.  | No
| First paragraph | `.first`| Block | For any paragraph that starts a new set of paragraphs, flush left and with a gap above it. | No
| Float to top | `.float-top` | Block | Floats the element to the top of its page. Useful for boxes. Applies to print output only. | Yes
| Float to bottom | `.float-bottom` | Block | Floats the element to the bottom of its page. Useful for boxes. Applies to print output only. | Yes
| Footnote | `.sidenote .bottom` | Block or inline | When you add `.bottom` to `.sidenote`, the note appears at the foot of the page in print output. It remains on the side on screens. (Also see [Endnotes](#endnotes) above.) | No
| Fraction | `.fractions` | Block or inline | If your font supports it, converts characters like `1/2` into fraction characters. | No
| Glossary | `.glossary` | Block | Use this after the last entry in a series of definition lists to define the entire list of definitions as a glossary. | No
| Hide from print | `.non-printing` | Block or inline | Hides the element from print output. Useful for things like clickable buttons, which are only intended for screens, not paper. | No
| Keep together | `.keep-together` | Block | Prevents an element from breaking across pages. (E.g. you want to keep a short list on the same page.) | No
| Keep with next | `.keep-with-next` | Block | Prevents a page break between this element and the next one. | No
| Logo image | `.logo` | Block | Used for making images small, especially for small logos in text like on acknowledgements pages. | No
| Page break after | `.page-break-after` | Block | Creates a page break after the element. | No
| Page break after, end of book | `.page-break-after-right` | Block | When applied to the very last element in the book, ensures a blank verso for an even-numbered page extent. | No
| Page break before | `.page-break-before` | Block | Starts its element on a new page. | No
| Page break: allow | `.allow-break` | Block | Allows an element to break over a page where the default styles would normally prevent that. Apply the class to the parent element. | No
| Poetry | `.verse` | Block | Designing poetry is tricky and important. Read about how to manage this [in our workflow guide](https://github.com/electricbookworks/electric-book-workflow#poetry). | No
| Pull quote | `.pullquote` | Block | Displays a paragraph as a pull quote. | No
| Shrink font | `.shrink` | Block or inline | Shrinks the font size to 70%. Can be useful for wide tables. | Yes
| Sidenote | `.sidenote` | Block or inline | A sidenote appears in a sidebar to the right of the text. | No
| Small caps (lowercase only) | `.smallcaps` | Block or inline | If your font supports proper small-caps glyphs. Only affects the lowercase letters. | No
| Small caps throughout | `.allsmallcaps` | Block or inline | If your font supports proper small-caps glyphs, all characters are small caps. | No
| Source after a quotation | `.source` | Block | The name and/or title of the source for a preceding quotation. | No
| Table caption | `.table-caption` | Block | Add `{:.table-caption}` in the line immediately after a table caption. Table captions must always appear above tables, not after them. | No
| Table caption | `.table-caption` | Block | Use for the caption above a table. (Table captions should not appear after tables, only before.) | No
| Title page: author | `.title-page-author` | Block | The book's author(s) on the title page. | No
| Title page: logo | `.title-page-logo` | Block | A logo, as an image, on the title page. | No
| Title page: subtitle | `.title-page-subtitle` | Block | The book's subtitle on the title page. | No
| Title page: title | `.title-page-title` | Block | The book's title on the title page. | No
| Tracking: tighten | `.tighten` | Block or inline | Slightly tightens the space between letters. *Affects print output only.* | Yes
| Tracking: tight | `.tight` | Block or inline | Imperceptibly shrinks the gaps between letters. *Affects print output only.* | Yes
| Tracking: tighter | `.x-tight` | Block or inline | Shrinks the gaps between letters a tiny bit. *Affects print output only.* | Yes
| Tracking: very tight | `.xx-tight` | Block or inline | Shrinks the gaps between letters visibly. *Affects print output only.* | Yes
| Tracking: extremely tight | `xxx-tight` | Block or inline | Really tightens letters up close. Use as a last resort. *Affects print output only.* | Yes
| Tracking: loosen | `.loosen` | Block or inline | Slightly loosens the space between letters. *Affects print output only.* | Yes
| Tracking: loose | `.loose` | Block or inline | Imperceptibly widens the gaps between letters. *Affects print output only.* | Yes
| Tracking: looser | `.x-loose` | Block or inline | Widens the gaps between letters. *Affects print output only.* | Yes
| Valediction | `.valediction` | Block | Used for the sign-off at the end of a letter, preface or foreword. | No

## The edition suffix

If you want to produce more than one print edition of a book from the same source file, you can't use the same classes that affect text-flow – like `.tighten`, for instance – in both editions, because the text will flow differently in each edition.

Our workflow has a way to manage that. In the print CSS file, you can specify an edition suffix. For instance, if you're producing a schools edition of a book, you might make your suffix `-schools-edn`. That suffix will be appended to the end of certain class names for that stylesheet. The default `.tighten` class will become `.tighten-schools-edn` in your final print CSS.

(It's a good idea to start a suffix with a hyphen, to keep your output CSS neat.)

Only some classes are affected – see the table above for which ones. The most important are the classes used for tightening and loosening letter-spacing, which are mostly used to control widows and orphans in print layout.

In your markdown, then, you'd use `{:.tighten-schools-edn}` instead of `{:.tighten}`, and that class will then only have an effect on your schools edition. If you had another edition, say a professional edition with a `-prof-edn` suffix, you'd use a `{:.tighten-prof-edn}` tag in the markdown. These would match the classes automatically generated in each edition's CSS.

Of course, one element can carry both classes. For instance, you might end up with a paragraph tagged with `{:.tighten-schools-edn .tighten-prof-edn}`. That paragraph would then be tightened in both print layouts.
