---
layout: page
title: Site template features
---

# {{ page.title }}

**programming pages** offers the following:
{:.larger.text}

- searchable content, with keyboard shortcuts (try `?`)
- mobile-ready design browsable on multiple devices
- simple authoring syntax using [Markdown](/examples/sampler/#/examples/) and [Liquid][liquid]
- styling for readability, leveraging [Semantic UI][semantic-ui]
- clean site generation that scores well on [PageSpeed Insights][pagespeed]
- compatibility with [GitHub Pages][ghpages] for free hosting and simple publishing
{:.larger.text}

Elements of the site template are explained in detail in the sections below:

- TOC
{::options toc_levels="2,3" /}
{:toc}

## Overview
{:.no_toc}

The site template provides a Home link (&nbsp;<i><svg class="icon"><use xlink:href="#home" /></svg></i>) in the top left corner that returns to the [site entry page][homepage], and a navigation menu (&nbsp;<i><svg class="icon"><use xlink:href="#bars" /></svg></i>) on the left side of the screen where content can be accessed via links under the collection tabs (e.g. [Layouts](#/api "toggle the Layouts collection"), [Examples](#/examples "toggle the Examples collection"), or [Guides](#/guides "toggle the Guides collection")), or via the search box (&nbsp;<i><svg class="icon"><use xlink:href="#magnifier" /></svg></i>).

To search for content, focus the search input, and start typing a term to search for. A results box will populate with best matches. Select one to navigate to the page.

<i><svg class="icon"><use xlink:href="#info-circle" /></svg></i>
On a desktop, open the help menu with the `?` key to see keyboard shortcuts for toggling navigation tabs and searching.
{:.ui.info.message}


## Title Bar

The site title bar is fixed to the top of screen, and displays the following items:

- _home link_ &mdash; built into the template
- _menu link_ &mdash; appears in narrow or mobile views, where the menu is collapsed
- _project name_ &mdash; defined in `_config.yml` as `project.name`
- _project version_ &mdash; defined in `_config.yml` as `project.version`


## Attribution

At the bottom of every content page is the attribution element, which contains:

- _documentation license_ &mdash; [Creative Commons Attribution (CC-BY)][cc-by], built into the template
- _project copyright_ &mdash; composed from `project.name` and `project.owner`in `_config.yml`, and the current year
- _project repository_ &mdash; defined in `_config.yml` as `project.repo`


## Help overlay

When a user presses the `?` key, a help overlay appears and shows the shortcut keys available for use.


## Navigation

On the left-hand side of the site is a navigation pane that collapses in mobile or narrow desktop views. It contains a search field and the collection tabs.

### Search input

All page titles are available to search for, and the search box will try to auto-complete best matches.

### Collection indices

Collections provided by the user are represented by tabs in the navigation pane.

Collections may have sub-folders. When a folder name matches a content page, files in the folder will render as children of the content page.

## Content layouts

The site template provides several pre-defined layouts for rendering different kinds of documentation content.

Please see the individual layout pages for more detail:

- [base](/api/base/#/api/)
- [compress](/api/compress/#/api/)
- [example](/api/example/#/api/)
- [guide-index](/api/guide-index/#/api/)
- [layout](/api/layout/#/api/)
- [package](/api/package/#/api/)
- [page](/api/page/#/api/)
- [type](/api/type/#/api/)



[cc-by]: https://creativecommons.org/licenses/by/4.0/ "Creative Commons Attribution 4.0 International (CC BY 4.0)"
[ghpages]: https://pages.github.com/ "Websites for you and your projects. Hosted directly from your GitHub repository"
[homepage]: /guides/Authoring-Documentation/#homepage "User-authored homepage"
[liquid]: https://shopify.github.io/liquid/ "Safe, customer-facing template language for flexible web apps"
[pagespeed]: https://developers.google.com/speed/pagespeed/insights/ "Make your web pages fast on all devices"
[semantic-ui]: https://semantic-ui.com/ "Semantic is a development framework that helps create beautiful, responsive layouts using human-friendly HTML"
