---
layout: "layout"

title: "guide-index"
description: |
  For a given page in the `guides` collection, `guide-index` prepends a list of child-page links to the provided page content.

  Useful for top-level pages in guide folders.

  Page content is expected in [Markdown format](../../examples/sampler/#/examples/).
parent_layout: [ "page", "base", "compress" ]
parameters:
  - { name: "title", type: "string", description: "name of guide folder" }
---
