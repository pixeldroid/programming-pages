---
layout: "layout"

title: "base"
description: "Provides the boilerplate html page structure, setting up the viewport and including css and scripts. Accepts content for the body."
parent_layout: [ "compress" ]
parameters:
  - { name: "title", type: "string", optional: true, description: "title of the page, used to render in indices. If not provided, defaults to sanitized file name." }
---
