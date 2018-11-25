---
layout: page
title: Liquid Includes
---

{::options parse_block_html="true" /}

# {{ page.title }}

GitHub Pages content is processed by Jekyll, which allows both [parameterized file inclusion] and the use of the [liquid] templating language. By combining these two features, macro-like functionality is possible.
{:.ui.info.message}

Each section on this page illustrates liquid syntax that can be used to invoke macros provided by the **programming pages** theme.
{:.larger.text}


- TOC (this line will be replaced by the table of contents)
{::options toc_levels="2,3" /}
{:toc}


## icon.liquid

> SVG icons are defined in [_data/icons/theme.yml][svg-file] by the theme.  See the [markdown sampler] for a list of icon ids.

<span>{% include icon.liquid id='check-circle' %} <b>Tip</b></span><br> Users may also define icons of their own, by adding additional icon data files under `_data/icons/`. See the [source comments][svg-file] for more details.
{:.ui.success.message}

| parameter | description |
|-----------|-------------|
| `id`      | icon name from yaml data file |
| `class`   | (optional) css class string to apply to the embedded svg element in addition to `icon` |
{:.ui.celled.table}

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    {% raw %}{% include icon.liquid id='star' %}{% endraw %}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
{% include icon.liquid id='star' %}
</div>
{:.ui.attached.secondary.segment}


## ordered\_child\_list.liquid

> generates an html list of child pages, respecting their `page.order` value. <br>
> only first-level children are listed, grandchildren and beyond are ignored.
> order: `0` is first, `-1` is last, undefined orders go in the middle alphabetically

| parameter | description |
|-----------|-------------|
| `docs` | reference to list of Jekyll collection docs |
| `page` | (optional) reference to scoping page, restricting the list to children of the page |
{:.ui.celled.table}

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    {% raw %}{% include ordered_child_list.liquid docs=site.examples %}{% endraw %}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

{::options parse_block_html="false" /}
<div>
{% include ordered_child_list.liquid docs=site.examples %}
</div>
{:.ui.attached.secondary.segment}
{::options parse_block_html="true" /}


## package\_shortener.liquid

> abbreviates intermediary package names to their first letter: <br>
> `foo.bar.bat.Baz` &rarr; `foo.b.b.Baz`

| parameter   | description |
|-------------|-------------|
| `package`   | fully qualified package name |
| `threshold` | (optional) number of components to leave unabbreviated. defaults to 2 |
{:.ui.celled.table}

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    {% raw %}
    {% assign packages = "foo.bar.bat, foo.bar.bat.Baz, foo.Qix" | split: ", " %}
    {% for pkg in packages %}
    - {% include package_shortener.liquid package=pkg %}
    {% endfor %}
    {% endraw %}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
{% assign packages = "foo.bar.bat, foo.bar.bat.Baz, foo.Qix" | split: ", " %}
{% for pkg in packages %}
- {% include package_shortener.liquid package=pkg %}
{% endfor %}
</div>
{:.ui.attached.secondary.segment}


## page\_root.liquid

> extracts the first component of a page url: <br>
> `{{ page.url }}` &rarr; `{% include page_root.liquid page=page %}`

| parameter | description |
|-----------|-------------|
| `page` | reference to a Jekyll page object to extract the url root from |
{:.ui.celled.table}

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    {% raw %}
    {% include page_root.liquid page=page %}
    {% endraw %}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
{% include page_root.liquid page=page %}
</div>
{:.ui.attached.secondary.segment}


## render\_indices.liquid

> creates the individual links in the sidebar. <br>
> pages, layouts, and guide-indexes are indented when parented

<span>{% include icon.liquid id='info-circle' %} <b>Note</b></span><br> This include is made available for override, so that a site can customize how (or if) it renders the items in the side nav.
{:.ui.info.message}

| parameter | description |
|-----------|-------------|
| `doc_list`         | reference to list of Jekyll collection docs to generate indices for |
| `collection_label` | name of indices tab, to ensure links keep proper tab open |
| `page_title`       | title of the current page, to render matching indices as 'active' |
{:.ui.celled.table}

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    {% raw %}
    <div class="ui link list">
    {% assign collection = site.collections | where:"title","Examples" | first %}
    {% include render_indices.liquid doc_list=collection.docs collection_label=collection.label page_title=page.title %}
    </div>
    {% endraw %}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

{::options parse_block_html="false" /}

<div>
<div class="ui link list">
{% assign collection = site.collections | where:"title","Examples" | first %}
{% include render_indices.liquid doc_list=collection.docs collection_label=collection.label page_title=page.title %}
</div>
</div>
{:.ui.attached.secondary.segment}



[liquid]: https://shopify.github.io/liquid/ "Safe, customer-facing template language for flexible web apps"
[markdown sampler]: http://localhost:4000/examples/sampler/#icons "icons provided by the programming pages theme"
[parameterized file inclusion]: https://jekyllrb.com/docs/includes/#passing-parameters-to-includes "jekyll: passing parameters to includes"
[svg-file]: https://github.com/pixeldroid/programming-pages/blob/master/_data/icons/theme.yml "source file for SVG icons provided by default"
