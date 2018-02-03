---
layout: "layout"

title: "example"
description: "Creates an example page by placing an optional thumbnail image above a tab container presenting syntax-highlighted code files."
parent_layout: "page"
parameters:
  - { name: "title", type: "string", description: "name for the example" }
  - { name: "thumb", type: "string", optional: true, description: "url to a thumbnail image" }
  - { name: "code", type: "[ { url: string, language: string }, .. ]", description: "list of example source file urls to be rendered (one to a tab), each with an optional language identifier for syntax highlighting" }
---
