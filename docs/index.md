---
layout: page
title: Introduction
---

# {{ page.title }}

**programming pages** is a site theme for publishing documentation of code on [GitHub Pages][gh-pages]. This site is an example of the theme in use, rendering the markdown files found [here][site-docs].
{:.larger.text}

With this theme applied to your project, you can author documentation in [Markdown][markdown-sampler] files, and rely on the theme layouts to index them for browsing and search and render them in style.

Learn more about this theme in the following guides:

{% include ordered_child_list.liquid docs=site.guides %}


[gh-pages]: https://pages.github.com/ "Websites for you and your projects"
[markdown-sampler]: {{ site.baseurl }}/examples/sampler/#/examples/ "Samples of the markdown supported by lsdoc and GitHub Pages"
[site-docs]: https://github.com/pixeldroid/programming-pages/tree/master/docs "Source files for programming pages documentation"
