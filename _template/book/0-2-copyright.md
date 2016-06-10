---
title: Copyright
style: copyright-page

# The Liquid tags here fetch metadata 
# from this book's YML file in _data
---

# Copyright
{:.non-printing}

{% include get-slug.html %}

*{{ site.data.meta.[slug].title }}*\\
Text © {{ site.data.meta.[slug].creator }}

{% for id in site.data.meta.[slug].products.print.identifier %}
ISBN ({{ site.data.meta.[slug].products.print.format }}): {{ id }}
{% endfor %}

{% for id in site.data.meta.[slug].products.epub.identifier %}
ISBN ({{ site.data.meta.[slug].products.epub.format }}): {{ id }}
{% endfor %}

{{ site.data.meta.[slug].rights }}
