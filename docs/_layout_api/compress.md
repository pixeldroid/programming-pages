---
layout: "layout"

title: "compress"
description: |
  `compress` removes non-license comments and blank lines outside of `<pre>` tags for the provided content.

  Iteration within Liquid templates can often result in extra blank lines. This layout is a root level filter to clean up html source and reduce file size.

  `compress` is a simplified version of [jekyll-compress-html].

  [jekyll-compress-html]: https://github.com/penibelst/jekyll-compress-html "A Jekyll layout that compresses HTML in pure Liquid"
parent_layout: [ ]
---
