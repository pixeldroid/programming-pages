---
layout: guide-index
title: Installing the site template
order: 2
---

The programming pages template is a collection of files designed to be dropped into your project as the basis of its documentation folder.
{:.larger.text}

Installation is two steps:

1. Download the latest [release][releases]
1. Extract it into your project folder under `docs/`

Then use the template to:

1. [Author][author] your content
1. [Publish][publish] to GitHub Pages
1. (optionally) modify the template to taste

<i><svg class="icon"><use xlink:href="#info-circle" /></svg></i>
You might want to consider keeping your authored documentation and any template customizations separate from the template files to enable easier updates of the template. This can be accomplished with a build task that copies authored content from its source folders into the appropriate template folders.
{: .ui.info.message}



[author]: /guides/Authoring-Documentation/#/guides/ "Authoring documentation"
[publish]: /guides/Publishing-to-GitHub-Pages/#/guides/ "Publishing to GitHub Pages"
[releases]: https://github.com/pixeldroid/programming-pages/releases "Packaged releases of the Programming Pages template"
