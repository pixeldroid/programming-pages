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

  Also brings the [SVG icons]({{ site.baseurl }}/examples/sampler/#icons) into scope.
parent_layout: "base"
parameters:
  - { name: "order", type: "string", optional: true, description: "ordinal to be used for sorting. Only applies to guides; all other collections are sorted alphabetical by title." }
---
