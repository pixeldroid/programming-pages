---
layout: page
title: Theme features
description: list of features provided by the theme
order: 1
---

# {{ page.title }}

**programming pages** offers the following:
{:.larger.text}

- pre-built [site structure](#overview)&mdash;just add documentation
- simple authoring syntax using [Markdown]({{site.baseurl}}/examples/sampler/#/examples/) and [Liquid][liquid]
- ready-to-use [layouts](#/layout_api), extensible to create new ones
- [searchable content](#search-input), with keyboard shortcuts (try `h`)
- mobile-ready design browsable on multiple devices
- styling for readability, leveraging [Semantic UI][semantic-ui]
- clean site generation that scores well on [Lighthouse][lighthouse] audits
- compatibility with [GitHub Pages][ghpages] for free hosting and simple publishing
{:.larger.text}

Elements of the theme are explained in detail in the sections below:

- TOC
{::options toc_levels="2,3" /}
{:toc}

## Overview
{:.no_toc}

The programming pages theme provides a Home link (<span>{% include icon.liquid id='home' %}</span>) in the top left corner that returns to the [site entry page][homepage], and a navigation menu (<span>{% include icon.liquid id='bars' %}</span>) on the left side of the screen where content can be accessed via links under the collection tabs (e.g. [Layouts](#/layout_api "toggle the Layouts collection"), [Examples](#/examples "toggle the Examples collection"), or [Guides](#/guides "toggle the Guides collection")), or via the search box (<span>{% include icon.liquid id='magnifier' %}</span>).

To search for content, focus the search input, and start typing a term to search for. A results box will populate with best matches. Select one to navigate to the page.

<span>{% include icon.liquid id='info-circle' %} <b>Info</b></span><br> On a desktop, the `s` key will focus the search input. Open the help menu with the `h` key to see other keyboard shortcuts for toggling navigation tabs and searching.
{:.ui.info.message}


## Title Bar

The site title bar is fixed to the top of screen, and displays the following items:

- _home link_ &mdash; built into the theme
- _menu link_ &mdash; appears in narrow or mobile views, where the menu is collapsed
- _project name_ &mdash; defined in `_config.yml` as `project.name`
- _project version_ &mdash; defined in `_config.yml` as `project.version`


## Attribution

At the bottom of every content page is the attribution element, which contains:

- _documentation license_ &mdash; [Creative Commons Attribution (CC-BY)][cc-by], built into the theme
- _project copyright_ &mdash; composed from `project.name` and `project.owner`in `_config.yml`, and the current year
- _project repository_ &mdash; defined in `_config.yml` as `project.repo`


## Help overlay

When a user presses the `h` key, a help overlay appears and shows the shortcut keys available for use.


## Navigation

On the left-hand side of the site is a navigation pane that collapses in mobile or narrow desktop views. It contains a search field and the collection tabs.

### Search input

All page titles are available to search for, and the search box will try to auto-complete best matches.

Search also includes words found in `page.description` and `page.search_tags`. Search results are categorized by collection, which can be overridden by `page.category`.

### Collection indices

Collections provided by the user are represented by tabs in the navigation pane.

Collections may have sub-folders. When a folder name matches a content page, files in the folder will render as children of the content page.

## Content layouts

The programming pages theme provides several pre-defined layouts for rendering different kinds of documentation content.

Please see the individual layout pages for more detail:

{% include ordered_child_list.liquid docs=site.layout_api %}



[cc-by]: https://creativecommons.org/licenses/by/4.0/ "Creative Commons Attribution 4.0 International (CC BY 4.0)"
[ghpages]: https://pages.github.com/ "Websites for you and your projects. Hosted directly from your GitHub repository"
[homepage]: {{site.baseurl}}/guides/Authoring-Documentation/#homepage "User-authored homepage"
[liquid]: https://shopify.github.io/liquid/ "Safe, customer-facing template language for flexible web apps"
[lighthouse]: https://developers.google.com/web/tools/lighthouse/ "Lighthouse is an open-source, automated tool for improving the quality of web pages"
[semantic-ui]: https://semantic-ui.com/ "Semantic is a development framework that helps create beautiful, responsive layouts using human-friendly HTML"
