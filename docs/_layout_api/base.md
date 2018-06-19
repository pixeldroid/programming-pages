---
layout: "layout"

title: "base"
description: |
  Provides boilerplate html page structure for the **programming pages** template, setting up the viewport and including css and scripts.

  The `base` layout does not provide any special content formatting, and is typically inherited from by another layout that handles specialized rendering.
parent_layout: [ "compress" ]
parameters:
  - { name: "title", type: "string", optional: true, description: "title of the page, used to render in indices. If not provided, defaults to sanitized file name." }
---
