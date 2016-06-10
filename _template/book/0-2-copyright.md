---
title: Copyright
style: copyright-page

# The Liquid tags here fetch metadata 
# from this book's YML file in _data
---

# Copyright
{:.non-printing}

{% include get-slug.html %}

*{{ site.data.[slug].title }}*\\
Text © {{ site.data.[slug].creator }}

{% for id in site.data.[slug].print.identifier %}
ISBN ({{ site.data.[slug].print.format }}): {{ id }}
{% endfor %}

{% for id in site.data.[slug].epub.identifier %}
ISBN ({{ site.data.[slug].epub.format }}): {{ id }}
{% endfor %}

{{ site.data.[slug].rights }}
