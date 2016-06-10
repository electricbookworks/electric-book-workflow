---
title: Title page
style: title-page
---

{% include get-slug.html %}

{{ site.data.meta.[slug].title }}
{:.title-page-title}

{{ site.data.meta.[slug].subtitle }}
{:.title-page-subtitle}

{{ site.data.meta.[slug].creator }}
{:.title-page-author}

{{ site.data.meta.[slug].publisher }}
{:.title-page-publisher}
