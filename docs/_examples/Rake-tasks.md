---
layout: example

code:
  - { label: Import task, url: snippet.rake, language: ruby }
  - { label: Task list, url: tasks.txt, language: text }
thumb: tasks.draw-io.png
title: Rake tasks
---

For projects already using [rake][rake] as a build tool, programming pages provides tasks for some common build activities (see _Task list_ below).

These include a `docs:build` task to combine project-authored documentation and customization files with template files, so the template can be kept separate and easily updateable.
Updating the template can be accomplished with the `template:update` task, which fetches the latest release from GitHub and unpacks it into a specified template folder.

The `programming-pages.rake` file needs to be included (see _Import Task_ below), after some global constants are set.
These constants provide context required by the rake tasks, so that the project root, the template files location, and the documentation source files location are known.



[rake]: https://github.com/ruby/rake "A make-like build utility for Ruby"
