---
layout: "layout"

title: "page"
description: |
  Renders the core structural elements of a documentation page:

  - title bar header
  - search input and results area
  - collection indices
  - main content area
  - attribution footer
  - modal help dialog

  See [template features](../../guides/Template-Features/#/guides/) for details of the different elements.

  The `page` template is designed to be inherited from. It only accepts a single parameter, and only for pages in the guides collection, to specify a relative order value that is used to sort against sibling guide pages.
parent_layout: [ "base", "compress" ]
parameters:
  - { name: "order", type: "string", optional: true, description: "ordinal to be used for sorting. Positive numbers will be sorted first, in ascending order, with `0` the first possible value. Negative numbers will be sorted last, in descending order, with `-1` the last possible integer value (whichever value is closest to, but less than, zero will be last). Pages without an `order` value will fall in between, sorted alphabetically by filename (not title). Only applies to guides; all other collections are sorted alphabetically by filename. Ordering comparisons are only performed between siblings (files in the same folder), not across parent-child levels." }
---
