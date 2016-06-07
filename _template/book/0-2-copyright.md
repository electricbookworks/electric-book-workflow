---
title: Copyright
style: copyright-page

# The Liquid tags here fetch metadata 
# from this book's YML file in _data
---

# Copyright
{:.non-printing}

*{{ site.data.[page.slug].title }}*\\
Text © {{ site.data.[page.slug].creator }}

{% for id in site.data.[page.slug].print.identifier %}ISBN ({{ site.data.[page.slug].print.format }}): {{ id }}{% endfor %}\\
{% for id in site.data.[page.slug].epub.identifier %}ISBN ({{ site.data.[page.slug].epub.format }}): {{ id }}{% endfor %}

{{ site.data.[page.slug].rights }}
