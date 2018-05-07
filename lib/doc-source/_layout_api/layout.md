---
layout: "layout"

title: "layout"
description: |
  Renders documentation of a Jekyll layout. This page is an example of a documented layout.

  Page variables to be documented should be provided as an object with the following keys:
  ```yaml
  variable_info:
    attributes: [ string ]
    type: string
    optional: boolean
    description: string
  ```
parent_layout: "layout"
parameters:
  - { name: "title", type: "string", description: "filename of layout, without extension" }
  - { name: "description", type: "string", description: "purpose of layout" }
  - { name: "parent_layout", type: "string", description: "name of layout based upon" }
  - { name: "parameters", optional: true, type: "[ variable_info, .. ]", description: "list of supported page variables" }
---
