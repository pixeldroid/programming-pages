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



[liquid]: https://shopify.github.io/liquid/ "Safe, customer-facing template language for flexible web apps"
[markdown sampler]: http://localhost:4000/examples/sampler/#icons "icons provided by the programming pages theme"
[parameterized file inclusion]: https://jekyllrb.com/docs/includes/#passing-parameters-to-includes "jekyll: passing parameters to includes"
[svg-file]: https://github.com/pixeldroid/programming-pages/blob/master/_data/icons/theme.yml "source file for SVG icons provided by default"
