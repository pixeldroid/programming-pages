---
layout: example

code:
  - { label: workflow.dot, url: workflow.dot, language: dot }
  - { label: command line, url: invocation.console, language: console }
thumb: workflow.dot.png
title: Using the example layout
description: how to use the `example` layout
---

The `example` layout presents text, imagery and code together in a layout useful for showing how things work.
{:.larger.text}

Images are optional and float to the left of the text when provided, stacking in mobile view.

Code listings are also optional. Multiple files are supported via a tabbed interface.
Syntax highlighting is applied if a valid [rouge syntax lexer] is specified.
See the [layout api reference] for usage details.

The diagram in this example shows the basic workflow when using the programming pages theme.
First time setup involves having a current version of ruby and installing jekyll and bundler.
Full installation details are available in the [Installation Guide].

Once initialized, a site is ready for content to be authored and published.
Please see [Authoring Documentation] and [Publishing to GitHub Pages] for additional information.

The code figures in this example are a [Graphviz] file (`workflow.dot`) and the command line to render it as an image.
The diagram on this page was created this way.



[Authoring Documentation]: {{site.baseurl}}/guides/Authoring-Documentation/#/guides/
[Graphviz]: http://www.graphviz.org/ "Graphviz - Graph Visualization Software"
[Installation Guide]: {{site.baseurl}}/guides/Installing-the-theme/#/guides/ "installing the programming pages theme"
[layout api reference]: {{site.baseurl}}/layout_api/example/#/layout_api/ "programming pages example layout"
[Publishing to GitHub Pages]: {{site.baseurl}}/guides/Publishing-to-GitHub-Pages/#/guides/
[rouge syntax lexer]: https://github.com/jneen/rouge/tree/master/lib/rouge/lexers "rouge lexers available for syntax highlighting"
