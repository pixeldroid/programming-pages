---
layout: page
title: Introduction
category: home
description: overview of the programming-pages theme
---

# {{ page.title }}

**programming pages** is a Jekyll theme for publishing documentation of code on [GitHub Pages]. This site is an example of the theme in use, rendering the markdown files found [here][site-docs].
{:.larger.text}

With this theme [applied to your project], you can author documentation in [Markdown] files and rely on the [theme layouts] to index them for browsing and search and render them in style.
{:.larger.text}

Learn more about this theme in the following guides:

{% include ordered_child_list.liquid docs=site.guides %}



[applied to your project]: {{site.baseurl}}/guides/Installing-the-theme/#usage "how to use this theme"
[GitHub Pages]: https://pages.github.com/ "Websites for you and your projects"
[Markdown]: {{site.baseurl}}/examples/sampler/#/examples/ "Samples of the markdown supported by lsdoc and GitHub Pages"
[site-docs]: https://github.com/pixeldroid/programming-pages/tree/master/docs "Source files for programming pages documentation"
[theme layouts]: {{site.baseurl}}/layout_api/overview/#/layout_api/ "progamming pages provides extensible page layouts for documentation pages and examples"