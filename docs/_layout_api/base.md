---
layout: "layout"

title: "base"
description: |
  `base` provides boilerplate html page structure for the **programming pages** theme, setting up the viewport and including css and scripts.

  The `base` layout does not provide any special content formatting; it is designed to be inherited from by another layout that leverages the base css and scripts to implement features.

  Most programming pages theme features are implemented in the [page] layout.

  [page]: ../page/#/layout_api/ "page layout of the programming-pages theme"
parent_layout: [ "compress" ]
parameters:
  - { name: "title", type: "string", optional: true, description: "title of the page, used to render in indices. If not provided, defaults to file name." }
---
