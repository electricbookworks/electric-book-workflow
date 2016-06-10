---
title: Title page
style: title-page
---

{% include get-slug.html %}

{{ site.data.[slug].title }}
{:.title-page-title}

{{ site.data.[slug].subtitle }}
{:.title-page-subtitle}

{{ site.data.[slug].creator }}
{:.title-page-author}

{{ site.data.[slug].publisher }}
{:.title-page-publisher}
