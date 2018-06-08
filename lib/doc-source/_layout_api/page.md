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
parent_layout: [ "base", "compress" ]
parameters:
  - { name: "order", type: "string", optional: true, description: "ordinal to be used for sorting. Only applies to guides; all other collections are sorted alphabetical by title." }
---
