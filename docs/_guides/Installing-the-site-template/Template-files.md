---
layout: page
title: Site template files
---

# {{ page.title }}

The programming pages site template provides the css, javascript, and [Jekyll][ghjekyll] layouts necessary for [GitHub Pages][ghpages] to generate a documentation site.
{:.larger.text}

This guide describes the folder structure, layouts, and include files used by the site template.
{:.larger.text}


- TOC
{::options toc_levels="2,3" /}
{:toc}


## Overview

The programming pages template comprises the following main pieces, discussed in detail in the sections below:

    ├─_config.yml       / project data and config values for Jekyll
    ├─_includes/        / liquid partials
    │ ├─elements/       / html partials used in layouts
    │ ├─scripts/        / js partials and libraries used in layouts
    │ ├─styles/         / css used in layouts
    │ │ ├─semantic-ui/  / css framework files
    │ └─themes/         / css theme files
    ├─_layouts/         / Jekyll page layouts
    ├─scripts/          / javascript aggregation into single file
    └─styles/           / css aggregation into single file

User authored content should provide a homepage and some combination of API documentation, examples, and/or guides:

    ├─index.md          / user provided homepage
    ├─_api/             / (optional) user provided api reference
    ├─_examples/        / (optional) user provided examples
    └─_guides/          / (optional) user provided guides


## Jekyll configuration

> Jekyll expects to find global site configuration values in `_config.yml`.

The template uses some configuration data values, and parameterizes some aspects of the site for the user to provide values for.

### User provided configuration

The user should provide the following project metadata values:

- `project.name` : _used in footer attribution_ &mdash; Name of the project being documented
- `project.owner` : _used in footer attribution_ &mdash; Copyright author
- `project.repo` : _used in footer attribution_ &mdash; Link to the project source code repo
- `project.version` : _used in title_ &mdash; Project version

### Template provided configuration

The template defines the following configuration values:

- `code_indent` : _used by the site template_ &mdash; Number of spaces to use when indenting lines of code in doc comments
- `collections` : _used by Jekyll_ &mdash; [Collection][jekyll-collection] folders to expect api docs, examples, and guides to live in
- `example_root` : _used by the site template_ &mdash; Site variable used in layouts to reference the examples path value
- `guide_root` : _used by the site template_ &mdash; Site variable used in layouts to reference the guides path value
- `highlighter` : _used by Jekyll_ &mdash; Specifies the [code hilighting engine used by GitHub Pages][ghpages-rouge] (Rouge), so local execution matches remote
- `module_root` : _used by the site template_ &mdash; Site variable used in layouts to reference the api docs path value
- `permalink` : _used by Jekyll_ &mdash; Specifies the 'pretty' permalink style (see [Built-in permalink styles][jekyll-permalink])
- `plugins` : _used by Jekyll_ &mdash; Requests enablement of the [jemoji plugin][ghpages-jemoji]
- `sass` : _used by Jekyll_ &mdash; Specifies compressed css when processed by the [scssify filter][jekyll-scssify]
- `template_version` : _used by the site template_ &mdash; Declares the current template version


## User content

The user must provide a homepage as `index.md`.

Content for collections is optional. To provide it, simply create one or more of the following directories and add content files to them:

- `_api/`
- `_examples/`
- `_guides/`

See the [Authoring Documentation][authoring-documentation] guide to learn more about writing the contents of these files.


## Template content

The programming pages template is a layered system of Jekyll layouts and included modules. The foundational layers are diagrammed below, illustrating what each layer builds upon, defines, and includes:

[![layouts](template-structure.png "diagram of the template structure (draw.io)")](template-structure.png)
{:.ui.fluid.image}

### Layouts and includes

At the lowest level is the [compress][layout-compress] layout, which only removes whitespace and non-documentation comments for a smaller, cleaner file.

The first html rendering layer is the [base][layout-base] layout, which establishes the minimal outermost html boilerplate, defining a viewport for mobile compatibility, and linking in the global css and javascript.

The primary features of the programming pages template are brought in by the [page][layout-page] layout, which establishes the [title bar][feature-title] header, [attribution][feature-attribution] footer, [collection][feature-collections] indices, and a pop-up [modal help dialog][feature-help]. The title bar includes the [search input][feature-search] and results area.

Additional layouts build upon `page` to implement documentation specific arrangements, like package listings, type references, example figures, etc.

### Scripts

Each of the template features has an accompanying javascript partial that is defined under `_includes/scripts` and included by the [page][layout-page] layout.

Global scripts like the [jQuery][jquery] and [Semantic UI][semantic-ui] libraries are stored under their own folders in the `_includes/` directory, are aggregated by `scripts/site.js`, and are included by the [base][layout-base] layout.

### Styles

Programming pages uses the [Semantic UI][semantic-ui] framework for styling and navigation. The components used are stored under `_includes/styles/semantic-ui`, are aggregated by `styles/site.css`, and are included by the [base][layout-base] layout.

Also under `_includes/styles/` are the [svg icon][svg-icons] definitions and css customizations unique to the programming pages template.



[authoring-documentation]: /guides/Authoring-Documentation/#/guides/ "Authoring documentation with the programming pages template"
[feature-attribution]: /guides/Template-Features/#attribution "attribution feature"
[feature-collections]: /guides/Template-Features/#collection-indices "collections feature"
[feature-help]: /guides/Template-Features/#help-overlay "help feature"
[feature-search]: /guides/Template-Features/#search-input "search feature"
[feature-title]: /guides/Template-Features/#title-bar "title bar feature"
[ghjekyll]: https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/ "Using Jekyll as a static site generator with GitHub Pages"
[ghpages-jemoji]: https://help.github.com/articles/emoji-on-github-pages/ "Emoji on GitHub Pages"
[ghpages-rouge]: https://help.github.com/articles/using-syntax-highlighting-on-github-pages/ "Using syntax highlighting on GitHub Pages"
[ghpages]: https://pages.github.com/ "GitHub Pages"
[jekyll-collection]: https://jekyllrb.com/docs/collections/#step1 "Tell Jekyll to read in your collection"
[jekyll-permalink]: https://jekyllrb.com/docs/permalinks/#builtinpermalinkstyles "Built-in permalink styles"
[jekyll-scssify]: https://jekyllrb.com/docs/templates/#filters "Jekyll sassify filter"
[jquery]: https://jquery.com/ "jQuery javascript library"
[layout-base]: /api/base/#/api/ "base layout"
[layout-compress]: /api/compress/#/api/ "compress layout"
[layout-page]: /api/page/#/api/ "page layout"
[semantic-ui]: https://semantic-ui.com/ "Semantic UI css and javascript framework"
[svg-icons]: /examples/sampler/#icons "SVG icons provided by the programming pages template"
