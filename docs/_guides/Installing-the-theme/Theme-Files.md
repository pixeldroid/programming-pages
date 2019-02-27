---
layout: page
title: Theme files
description: details of the source files that compose this theme
order: 2.1
---

# {{ page.title }}

The programming pages theme provides the css, javascript, and [Jekyll][ghjekyll] layouts necessary for [GitHub Pages][ghpages] to generate a documentation site.
{:.larger.text}

This guide describes the folder structure, layouts, and include files used by the theme.
{:.larger.text}

> You don't need to understand these files in order to successfully [author content][authoring-documentation]. This documentation may be useful for those who wish to modify (or [correct][reporting-issues]) how the theme works.

- TOC
{::options toc_levels="2,3" /}
{:toc}


## Overview

The programming pages theme comprises the following main pieces, discussed in detail in the sections below:

    ├─_config.yml       / project data and config values for Jekyll
    ├─_data/            / svg icon definitions
    ├─_includes/        / liquid partials
    │ ├─elements/       / html partials used in layouts
    │ ├─scripts/        / js partials and libraries used in layouts
    │ ├─styles/         / css used in layouts
    │ │ ├─semantic-ui/  / css framework files
    │ └─themes/         / css theme files
    ├─_layouts/         / Jekyll page layouts
    └─assets/           / javascript and css aggregated files

User authored content should include a homepage and some combination of API documentation, examples, and/or guides:

    ├─_api/             / (optional) user provided api reference
    ├─_data/            / svg icon definitions
    ├─_examples/        / (optional) user provided examples
    ├─_guides/          / (optional) user provided guides
    ├─favicon.png       / (optional) user provided browser icon
    └─index.md          / user provided homepage


## Jekyll configuration

> Jekyll expects to find global site configuration values in `_config.yml`.

The theme uses some configuration data values, and parameterizes some aspects of the site for the user to provide values for.
A typical `_config.yml` may look like this:

```yaml
---
project:
  name: programming pages
  owner: pixeldroid
  repo: https://github.com/pixeldroid/programming-pages
  version: {{ layout.theme_version }}
collections:
  guides:
    output: true
    permalink: "/:collection/:path/"
    title: Guides
    tab-order: 1
  examples:
    output: true
    permalink: "/:collection/:path/"
    title: Examples
    tab-order: 2
  layout_api:
    output: true
    permalink: "/:collection/:path/"
    title: Layout API
    tab-order: 3
highlighter: rouge
kramdown:
  footnote_backlink: "⮌"
permalink: pretty
sass:
  style: compressed
plugins:
- jemoji
- jekyll-remote-theme
remote_theme: pixeldroid/programming-pages
```


### User provided configuration

The user should provide the following project metadata values:

- `project.name` : _used in footer attribution_ &mdash; Name of the project being documented
- `project.owner` : _used in footer attribution_ &mdash; Copyright author
- `project.repo` : _used in footer attribution_ &mdash; Link to the project source code repo
- `project.version` : _used in title_ &mdash; Project version

### Theme provided configuration

The theme defines the following configuration values by default; feel free to customize them:

- `collections` : _used by Jekyll_ &mdash; [Collection][jekyll-collection] folders to expect things like api docs, examples, and guides to live in
  - `<collection>.ignore-page-order` : _used by the theme_ &mdash; Turns off relative page ordering for a collection
  - `<collection>.tab-order` : _used by the theme_ &mdash; Specifies relative order for the collection tabs (lower to the left)
  - `<collection>.title` : _used by the theme_ &mdash; Label used for the collection tab
- `highlighter` : _used by Jekyll_ &mdash; Specifies the [code hilighting engine used by GitHub Pages][ghpages-rouge] (Rouge), so local execution matches remote
- `kramdown` : _used by Jekyll_ &mdash; Specifies [configuration settings for the kramdown processor][ghpages-kramdown]
  - `footnote_backlink` : _used by kramdown_ &mdash; Label to act as a 'return to citation' link in footnotes
- `permalink` : _used by Jekyll_ &mdash; Specifies the 'pretty' permalink style (see [Built-in permalink styles][jekyll-permalink])
- `plugins` : _used by Jekyll_ &mdash; Requests enablement of the [jemoji][ghpages-jemoji] and [jekyll-remote-theme][ghpages-jekyll-remote-theme] plugins
- `sass` : _used by Jekyll_ &mdash; Specifies compressed css when processed by the [scssify filter][jekyll-scssify]
- `remote_theme` : _used by the theme_ &mdash; Specifies the programming pages theme


## User content

The user must provide a homepage as `index.md`.

Content for collections is optional. To provide it, simply create one or more of the following directories and add content files to them:

- `_api/`
- `_examples/`
- `_guides/`

Collections are not limited to these three names&mdash;see the [Authoring Documentation][authoring-documentation] guide to learn more.


## Theme content

The programming pages theme is a layered system of Jekyll layouts and included modules.

The foundational layers are diagrammed below, illustrating what each layer builds upon, defines, and includes:

[![layouts](template-structure.draw-io.png "diagram of the template structure (draw.io)"){:.ui.image}](template-structure.draw-io.png)

### Layouts and includes

At the lowest level is the [compress][layout-compress] layout, which only removes whitespace and non-documentation comments for a smaller, cleaner file.

The first html rendering layer is the [base][layout-base] layout, which establishes the minimal outermost html boilerplate, defining a viewport for mobile compatibility, and linking in the global css and javascript.

The primary features of the programming pages theme are brought in by the [page][layout-page] layout, which establishes the [title bar][feature-title] header, [attribution][feature-attribution] footer, [collection][feature-collections] indices, and a pop-up [modal help dialog][feature-help]. The title bar includes the [search input][feature-search] and results area.

Additional layouts build upon `page` to implement documentation specific arrangements, like package listings, type references, example figures, etc.

Pages often utilize [liquid][liquid] templates to process lists of data into html. Common functionality is extracted into the various `.liquid` files that live in the `_includes` directory.

### Scripts

Each of the theme features has an accompanying javascript partial that is defined under `_includes/scripts` and included by the [page][layout-page] layout.

Global scripts like the [jQuery][jquery] and [Semantic UI][semantic-ui] libraries are stored under their own folders in the `_includes/` directory, are aggregated by `assets/site.js`, and are included by the [base][layout-base] layout.

### Styles

Programming pages uses portions of the [Semantic UI][semantic-ui] framework for styling and navigation. The components used are stored under `_includes/styles/semantic-ui`, are aggregated by `assets/site.css`, and are included by the [base][layout-base] layout.

Also under `_includes/styles/` are the css customizations unique to the programming pages theme.

### SVG Icons

In `_data/icons/theme.yml` are the [svg icon][svg-icons] definitions used by the theme, via the `icon.liquid` include macro.



[authoring-documentation]: {{site.baseurl}}/guides/Authoring-Documentation/#/guides/ "Authoring documentation with the programming pages theme"
[feature-attribution]: {{site.baseurl}}/guides/Theme-Features/#attribution "attribution feature"
[feature-collections]: {{site.baseurl}}/guides/Theme-Features/#collection-indices "collections feature"
[feature-help]: {{site.baseurl}}/guides/Theme-Features/#help-overlay "help feature"
[feature-search]: {{site.baseurl}}/guides/Theme-Features/#search-input "search feature"
[feature-title]: {{site.baseurl}}/guides/Theme-Features/#title-bar "title bar feature"
[ghjekyll]: https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/ "Using Jekyll as a static site generator with GitHub Pages"
[ghpages-jekyll-remote-theme]: https://github.com/benbalter/jekyll-remote-theme "Jekyll plugin for building Jekyll sites with any GitHub-hosted theme"
[ghpages-jemoji]: https://help.github.com/articles/emoji-on-github-pages/ "Emoji on GitHub Pages"
[ghpages-kramdown]: https://kramdown.gettalong.org/options.html "configuration options for the kramdown converter used in Jekyll"
[ghpages-rouge]: https://help.github.com/articles/using-syntax-highlighting-on-github-pages/ "Using syntax highlighting on GitHub Pages"
[ghpages]: https://pages.github.com/ "GitHub Pages"
[jekyll-collection]: https://jekyllrb.com/docs/collections/#step1 "Tell Jekyll to read in your collection"
[jekyll-permalink]: https://jekyllrb.com/docs/permalinks/#builtinpermalinkstyles "Built-in permalink styles"
[jekyll-scssify]: https://jekyllrb.com/docs/templates/#filters "Jekyll sassify filter"
[jquery]: https://jquery.com/ "jQuery javascript library"
[layout-base]: {{site.baseurl}}/layout_api/base/#/layout_api/ "base layout"
[layout-compress]: {{site.baseurl}}/layout_api/compress/#/layout_api/ "compress layout"
[layout-page]: {{site.baseurl}}/layout_api/page/#/layout_api/ "page layout"
[liquid]: http://shopify.github.io/liquid/ "Liquid is an open-source template language used by Jekyll"
[semantic-ui]: https://semantic-ui.com/ "Semantic UI css and javascript framework"
[reporting-issues]: {{site.baseurl}}/guides/Reporting-Issues-and-Contributing/#/guides/ "Reporting issues and contributing"
[svg-icons]: {{site.baseurl}}/examples/sampler/#icons "SVG icons provided by the programming pages theme"
