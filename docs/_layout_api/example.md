---
layout: "layout"

title: "example"
description: |
  `example` places an optional thumbnail image above a [tabular menu](https://semantic-ui.com/collections/menu.html#tabular "Semantic UI docs for tabular menu") of syntax-highlighted code files.

  See the [Rake tasks] documentation on this site for an example ([source]).

  [rake tasks]: ../../examples/Rake-tasks/#/examples/ "documentation that uses the example layout"
  [source]: https://raw.githubusercontent.com/pixeldroid/programming-pages/master/docs/_examples/Rake-tasks.md "source of a page using the example layout"
parent_layout: [ "page", "base", "compress" ]
parameters:
  - { name: "title", type: "string", description: "name for the example" }
  - { name: "thumb", type: "string", optional: true, description: "file path to a thumbnail image" }
  - { name: "code", type: "[ code_file, .. ]", description: "list of code files to be rendered, one to a tab, each with a tab label and optional language identifier for syntax highlighting.<br> use the following yaml format for each:\n```yaml\nlabel: string\nurl: string\nlanguage: string\n```\n file paths should be followable to Jekyll (i.e. in the scope of the `_docs` directory). language hints should come from the [rouge](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers \"languages supported by rouge\") vocabulary." }
---
