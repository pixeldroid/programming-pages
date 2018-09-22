---
layout: "layout"

title: "layout"
description: |
  Renders documentation of a Jekyll layout. This page is an example of a documented layout.

  Parameterized Jekyll layouts are rendering functions for a particular page format and style. A Jekyll layout can read data defined via page variables for rendering. This layout renders documentation of page variables and the inheritance chain for a given layout.

  Page variables to be documented should be provided as a yaml object with the following keys:
  ```yaml
  variable_info:
    attributes: [ string ]
    type: string
    optional: boolean
    description: string
  ```

  The inheritance chain should be provided as a yaml array named `parent_layout`.

  See the usage section below for an illustration of how to invoke this layout in a documentation file.
parent_layout: [ "page", "base", "compress" ]
parameters:
  - { name: "title", type: "string", description: "filename of layout, without extension" }
  - { name: "description", type: "string", description: "purpose of layout" }
  - { name: "parent_layout", type: "[ string, .. ]", optional: true, description: "chain of layouts this layout inherits from, ordered with parent first, then grandparent, great grandparent, and so on." }
  - { name: "parameters", optional: true, type: "[ variable_info, .. ]", description: "list of supported page variables" }
---
