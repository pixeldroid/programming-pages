---
layout: "layout"

title: "layout"
description: |
  `layout` creates documentation of a Jekyll layout.

  Layouts are like rendering functions that turn page variables and content data into specific HTML.
  This page is an example of `layout` in use, documenting itself ([source]).

  See the usage section below for an illustration of how to invoke this layout in a documentation file.

  [source]: https://raw.githubusercontent.com/pixeldroid/programming-pages/master/docs/_layout_api/layout.md "source of a page using the 'layout' layout"
parent_layout: [ "page", "base", "compress" ]
parameters:
  - { name: "title", type: "string", description: "filename of layout, without extension" }
  - { name: "description", type: "string", description: "purpose of layout. the first line will rendered as larger text. Because it is singled out, any links in the first line must use the [inline style](../../examples/sampler/#inline-url-links \"markdown documentation for inline links\")" }
  - { name: "parent_layout", type: "[ string, .. ]", optional: true, description: "chain of layouts this layout inherits from, ordered with parent first, then grandparent, great grandparent, and so on." }
  - { name: "parameters", optional: true, type: "[ variable_info, .. ]", description: "list of supported page variables. use the following yaml format for each:\n```yaml\nvariable_info:\n  attributes: [ string ]\n  type: string\n  optional: boolean\n  description: string (markdown supported; links must use inline style)\n```" }
---
