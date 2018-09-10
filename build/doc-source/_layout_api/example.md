---
layout: "layout"

title: "example"
description: |
  Renders an example page by placing an optional thumbnail image above a tab container of syntax-highlighted code files.

  See [Rake tasks](../../examples/Rake-tasks/#/examples/) for an example ([source](https://raw.githubusercontent.com/pixeldroid/programming-pages/master/lib/doc-source/_examples/Rake-tasks.md)).
parent_layout: [ "page", "base", "compress" ]
parameters:
  - { name: "title", type: "string", description: "name for the example" }
  - { name: "thumb", type: "string", optional: true, description: "file path to a thumbnail image" }
  - { name: "code", type: "[ { label: string, url: string, language: string }, .. ]", description: "list of example files to be rendered (one to a tab), each with a tab label and optional language identifier for syntax highlighting. File paths should be followable to Jekyll (i.e. in the scope of the `_docs` directory)." }
---
