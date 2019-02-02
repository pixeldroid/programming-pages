---
layout: "layout"

title: "compress"
description: |
  `compress` removes non-license comments and blank lines outside of `<pre>` tags for the provided content.

  Iteration within Liquid templates can result in extra blank lines (although Liquid does provide [whitespace controls]).

  `compress` is a root level filter to clean up html source and reduce file size. It is a simplified version of [jekyll-compress-html].

  [jekyll-compress-html]: https://github.com/penibelst/jekyll-compress-html "A Jekyll layout that compresses HTML in pure Liquid"
  [whitespace controls]: https://shopify.github.io/liquid/basics/whitespace/ "whitespace control in Liquid"
parent_layout: [ ]
---
