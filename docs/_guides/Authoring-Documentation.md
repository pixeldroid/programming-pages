---
layout: page
title: Authoring documentation
order: 3
---

# {{ page.title }}

Create collections of guides, examples, and API references by writing markdown files and organizing them under folders.
{:.larger.text}

Use template layouts to take advantage of parameterized display structures like package listings or guide indices.
{:.larger.text}

- TOC
{::options toc_levels="2,3" /}
{:toc}


## Content

Content is authored in Markdown, optionally enhanced with [icons][svg-icons] or [kramdown css extensions][kramdown-block-ial] to leverage [semantic ui styling][semantic-ui], or [Liquid tags][liquid] for programmatic content.

<span><svg class="icon"><use xlink:href="#icon-info-circle" /></svg></span> See the [Markdown Sampler][markdown-sampler] for examples.
{:.ui.info.message}

<span><svg class="icon"><use xlink:href="#icon-exclamation-triangle" /></svg></span> To use liquid tags, ensure the file starts with at least an empty [YAML front-matter block][front-matter].
{:.ui.warning.message}

User-authored content is expected in the following places:

    ├─_config.yml       / project configuration values
    ├─index.md          / user provided homepage
    ├─_api/             / (optional collection) user provided api reference
    ├─_examples/        / (optional collection) user provided examples
    └─_guides/          / (optional collection) user provided guides


### Project Configuration

The [title]({{ site.baseurl }}/guides/Template-Features/#title-bar) and [attribution]({{ site.baseurl }}/guides/Template-Features/#attribution) elements of the template use metadata defined in `_config.yml`.

See the [Site template files](http://localhost:4000/guides/Installing-the-site-template/Template-files/#user-provided-configuration) guide for more details.

### Homepage

The first page seen by a visitor to the site is defined by the contents of `index.md`.

This file must start with a [YAML front-matter declaration][front-matter], which may be empty. After that, content is up to the user.

Typically, a front-matter declaration will include at least the following:

```yaml
---
layout: page
title: My project
---
```

### Collections

Grouped documentation is called a _collection_ by Jekyll, and can be any folder of files that is named with an underscore and listed in the site configuration (`_config.yml`).

<span><svg class="icon"><use xlink:href="#icon-info-circle" /></svg></span> See the [Site template files guide]({{ site.baseurl }}/guides/Installing-the-site-template/Template-files/#template-provided-configuration) for details about specifying collection folders in the site configuration file.
{:.ui.info.message}

The programming pages template is pre-configured for three common collections (`_api`, `_examples`, `_guides`). To use one or more of them, simply create the collection folder and put content markdown files inside. Collections without a folder are ignored.

#### API reference

An API reference collection is for listing the constructs of the public interface of a library or service.

For a namespaced language this might look like:

    foo.html     / lists Bar and Baz as objects in the foo package
    foo/
        Bar.html / lists methods and properties of the Bar object
        Baz.html / lists methods and properties of the Baz object

#### Examples

Examples are for technical illustrations of how to implement something, ideally snippets of usable code with descriptive annotations.

See [Samples][samples] for some sample examples.

#### Guides

Guides are for explaining the concept of a topic, providing the context to be able to understand one or more examples.


## Layouts

The site template provides several pre-defined layouts for rendering different kinds of documentation content.

To use a layout, specify its name in the [YAML front-matter][front-matter] of the page:

```yaml
---
layout: guide-index
title: Installing the site template
---
```

Please see the individual layout pages for more detail:

- [base]({{ site.baseurl }}/layout_api/base/#/layout_api/)
- [compress]({{ site.baseurl }}/layout_api/compress/#/layout_api/)
- [example]({{ site.baseurl }}/layout_api/example/#/layout_api/)
- [guide-index]({{ site.baseurl }}/layout_api/guide-index/#/layout_api/)
- [layout]({{ site.baseurl }}/layout_api/layout/#/layout_api/)
- [package]({{ site.baseurl }}/layout_api/package/#/layout_api/)
- [page]({{ site.baseurl }}/layout_api/page/#/layout_api/)
- [type]({{ site.baseurl }}/layout_api/type/#/layout_api/)



[front-matter]: https://jekyllrb.com/docs/frontmatter/ "YAML front matter is at minimum a set of triple-dashed lines"
[kramdown-block-ial]: https://kramdown.gettalong.org/quickref.html#block-attributes "kramdown block attributes"
[liquid]: https://shopify.github.io/liquid/ "Safe, customer-facing template language for flexible web apps"
[markdown-sampler]: {{ site.baseurl }}/examples/sampler/#/examples/ "Samples of the markdown supported by lsdoc and GitHub Pages"
[semantic-ui]: https://semantic-ui.com/globals/site.html "Semantic is a development framework that helps create beautiful, responsive layouts using human-friendly HTML"
[svg-icons]: {{ site.baseurl }}/examples/sampler/#icons "A small set of svg iocns are included in the template"
