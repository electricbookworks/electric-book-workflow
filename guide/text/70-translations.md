---
title: Translations
---

# Translations

The Electric Book workflow allows for two different approaches to managing translations. A translation can be either

1. a subfolder of the main project, which mirrors in structure and filenames of the chapters of the parent edition, or 
2. a completely separate repository, which starts out as copy of the parent book (or series, for multi-work repos), but from that point on is treated as a new book, overwriting the original files in the repository with the new language. This is technically the same as an adaptation of the book (e.g. a separate edition of a textbook where content is changed for local needs).

Option 1 is best if the translation is managed by the central team that also manages the parent edition. It assumes that the translation and its parent will be kept in sync for the most part, the translation always being a faithful reproduction of the parent. 

Option 2 is best for when the translating team works independently, and especially if they want to make content changes that diverge from the parent. For instance, adding a new image or page-design feature, or changing design elements like fonts and colours.

## Setting up

Each translation must be added to the `meta.yml` file. All `translations` are a subset of `works`, alongside work-level metadata like `title`. Within `translations`, you list each language. Each language inherits the parent language's metadata unless overridden with its own metadata.

The `translations` node is equivalent to `works`, but for translations. The key feature that tells the system that it is a translation is that the `directory` and `language` fields are identical. For instance, for a French translation we would say:

```
  translations
    -
      directory: fr
      language: fr
```

Here is an example of a full `meta.yml` file that includes translations into Xhosa and French. Note how the translations can, but don't have to, include their own work-level metadata. Where it is included, it overrides the parent language's metadata. This means each translation can even have its own `files` list.

```
works:
  - directory: "book"
    title: "The Title"
    subtitle: ""
    creator: "A. N. Author" # E.g. the author
    contributor: "" # E.g. other contributors
    subject: "Fiction" # E.g. BISAC terms (https://www.bisg.org/bisac/bisac-subject-codes) or BIC (http://editeur.dyndns.org/bic_categories)
    description: "This is my awesome book." # E.g. the blurb
    publisher: "My Brand" # E.g. the publisher, imprint or brand name
    publisher-url: ""
    date: "2015-12-31" # YYYY-MM-DD e.g. publication date
    modified: "2016-06-09" # YYYY-MM-DD e.g. date of last revision
    type: "Novel" # e.g. Novel, Poetry, Memoir
    identifier: "" # e.g. ISBN or UUID
    source: "" # e.g. parent ISBN or ISTC
    language: "en" # use ISO 639-1, 639-2, or 639-3 codes (in that order of preference)
    relation: "" # e.g. other edition ISBN
    coverage: "" # e.g. geographic place or chronological time span
    rights: "All rights reserved.<br />No part of this book may be reproduced or transmitted in any form or by any electronic or mechanical means, including photocopying and recording, or any other information storage or retrieval system, without written permission from the publisher." # e.g. a copyright statement
    image: "cover.jpg"
    products: # Metadata for each product for this title (only use values that override parent metadata)
      print-pdf: 
        date: "2016-05-07" # YYYY-MM-DD e.g. publication or creation date
        format: "Print" # e.g. Paperback, Digital download, Digital online
        identifier: "" # e.g. ISBN or UUID
        image: "cover.jpg"
        files:
          - "0-1-titlepage"
          - "0-2-copyright"
          - "0-3-contents"
          - "01"
          - "02"
        toc: # For each menu item, include at least label and file. Optionally add id (for deep linking) and children.
          - label: "Chapter 1"
            file: "01"
            id: "hello-world"
          - label: "Chapter 2"
            file: "02"
            id: "goodbye-world"
            children: 
              - label: "Example child"
                file: "02"
                id: "example-id"
      web:
        date: "2016-05-07" # YYYY-MM-DD e.g. publication date or last revision
        format: "Digital online" # e.g. Paperback, Digital download, Digital online
        identifier: "" # e.g. ISBN or UUID
        image: "cover.jpg"
        files: # To add a file to web navigation, give a file a value, e.g. 0-4-preface: "Preface"
          - "index": Cover
          - "0-1-titlepage"
          - "0-2-copyright": "Copyright"
          - "0-3-contents": "Contents"
          - "01": "Chapter One"
          - "02": "Chapter Two"
        nav: # For each menu item, include at least label and file. Optionally add id (for deep linking) and children.
          - label: "Frontmatter"
            children:
              - label: "Cover"
                file: "index"
              - label: "Title page"
                file: "0-1-titlepage"
              - label: "Copyright"
                file: "0-2-copyright"
          - label: "Contents"
            file: "0-3-contents"
          - label: "Chapter One"
            file: "01"
            id: "1-hello-world"
          - label: "Chapter Two"
            file: "02"
            id: "2-goodbye-world"
            children: 
              - label: "Example child"
                file: "02"
                id: "example-id"
        start-page: "0-3-contents" # At which file should users start reading?
        contents-page: "0-3-contents" # Your contents-page file, if you have one.
        footer: "Powered by the <a href='http://electricbook.works'>Electric Book</a>" # Text that appears in the footer of the website. You can include HTML.
      epub:
        date: "2016-05-07" # YYYY-MM-DD e.g. publication date or last revision
        format: "Digital download" # e.g. Paperback, Digital download, Digital online
        identifier: "" # e.g. ISBN or UUID
        image: "cover.jpg"
        files:
          - "0-0-cover"
          - "0-1-titlepage"
          - "0-2-copyright"
          - "0-3-contents"
          - "01"
          - "02"
      screen-pdf:
        date: "2016-05-07" # YYYY-MM-DD e.g. publication date or last revision
        format: "Digital download" # e.g. Paperback, Digital download, Digital online
        identifier: "" # e.g. ISBN or UUID
        image: "cover.jpg"
        files:
          - "0-0-cover"
          - "0-1-titlepage"
          - "0-2-copyright"
          - "0-3-contents"
          - "01"
          - "02"
    translations:
      -
        directory: xh
        language: xh
        title: Title in Xhosa
        products:
          epub:
            date: "2016-05-07" # YYYY-MM-DD e.g. publication date or last revision
            format: "Digital download" # e.g. Paperback, Digital download, Digital online
            identifier: "" # e.g. ISBN or UUID
            image: "cover.jpg"
            files:
              - "0-0-cover"
              - "0-1-titlepage"
              - "0-2-copyright"
              - "0-3-contents"
              - "01"
              - "02"
      -
        directory: fr
        language: fr
        title: Title in French
        products:
          web:
            date: "2016-05-07" # YYYY-MM-DD e.g. publication date or last revision
            format: "Digital download" # e.g. Paperback, Digital download, Digital online
            identifier: "" # e.g. ISBN or UUID
            image: "cover.jpg"
            files:
              - "0-0-cover"
              - "0-1-titlepage"
              - "0-2-copyright"
              - "0-3-contents"
              - "01"
              - "02"
              - "03"
          epub:
            date: "2016-05-07" # YYYY-MM-DD e.g. publication date or last revision
            format: "Digital download" # e.g. Paperback, Digital download, Digital online
            identifier: "" # e.g. ISBN or UUID
            image: "cover.jpg"
            files:
              - "0-0-cover"
              - "0-1-titlepage"
              - "0-2-copyright"
              - "0-3-contents"
              - "01"
              - "02"
              - "03"
          print-pdf:
            date: "2016-05-07" # YYYY-MM-DD e.g. publication date or last revision
            format: "Paperback" # e.g. Paperback, Digital download, Digital online
            identifier: "" # e.g. ISBN or UUID
            image: "cover.jpg"
            files:
              - "0-0-cover"
              - "0-1-titlepage"
              - "0-2-copyright"
              - "0-3-contents"
              - "01"
              - "02"
              - "03"
```
