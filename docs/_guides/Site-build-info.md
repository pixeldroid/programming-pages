---
layout: page
title: Site build info
description: debug info from the last build of this site
order: -1
---

# {{ page.title }}

built {{ site.time | date_to_rfc822 }}
{:.ui.basic.label}

- TOC
{::options toc_levels="2,3" /}
{:toc}

## site.attributions

{% for v in site.attributions %}
- {{ v[0] }} : `{{ v[1] }}`
{% endfor%}

## site.baseurl

```liquid
'{{ site.baseurl }}'
```

## site.github

{% if site.github %}
### site.github.versions

{% for v in site.github.versions %}
- {{ v[0] }} : `{{ v[1] }}`
{% endfor%}

{% else %}
_(not on github)_
{% endif %}

## site.collections

> (excluding `posts`)

```liquid
{% raw %}{{ doc.title }} ({{ doc.layout }}) - {{ site.baseurl }}{{ doc.url }}{% endraw %}
```

{% for collection in site.collections -%}
{%- unless collection.label == 'posts' -%}
- {{ collection.label }}
  {%- for doc in collection.docs %}
   * {{ doc.title }} ({{ doc.layout }}) - {{ site.baseurl }}{{ doc.url }}
  {%- endfor %}
{% endunless -%}
{%- endfor %}

### guides

```liquid
{% raw %}{% assign guides = site.collections | where:'label','guides' | first %}{% endraw %}
```

{% assign guides = site.collections | where:'label','guides' | first %}

<pre>
depth order   name : path
{%- for doc in guides.docs -%}
{%- assign depth = doc.path | split:'/' | size | minus:1 %}
  {{ depth | default:'.' | prepend: '   ' | slice: -3, 3 }}   {{ doc.order | default:'.' | prepend: '   ' | slice: -3, 3 }}   {{ doc.title }} : {{ doc.path }}
{%- endfor -%}
</pre>

#### guide levels

{%- comment %} first, calculate max_depth as deepest level index {% endcomment -%}
{% assign max_depth = 0 %}
{% for doc in guides.docs %}
  {% assign depth = doc.path | split:'/' | size | minus:2 %} {%- comment %} minus one to convert from length to index, minus two to ignore root collection directory (_guides/) {% endcomment -%}
  {% if depth > max_depth %}{% assign max_depth = depth %}{% endif %}
{% endfor %}

{%- comment %} separate docs into levels, and sort by user-defined order value {% endcomment -%}
{% assign leveled = '' | split: '' %}
{% for i in (0..max_depth) %}
  {% assign new = '' | split: '' %}
  {% assign ordered = '' | split: '' %}
  {% assign endered = '' | split: '' %}
  {% assign unorder = '' | split: '' %}
  {% for doc in guides.docs %}
    {% assign depth = doc.path | split:'/' | size | minus:2 %}
    {% if depth == i %}
      {% if doc.order %}
        {% if doc.order < 0 %}{% assign endered = endered | push: doc %}
        {% else %}{% assign ordered = ordered | push: doc %}
        {% endif %}
      {% else %}{% assign unorder = unorder | push: doc %}
      {% endif %}
    {% endif %}
  {% endfor %}
  {% assign ordered = ordered | sort: 'order' %}
  {% assign endered = endered | sort: 'order' %}
  {% assign new = ordered | concat: unorder | concat: endered %}
  {% assign leveled = leveled | push: new %}
{% endfor %}

<pre>
{%- assign i = 0 -%}
{%- for lvl in leveled %}
{{ i }}: [{% for e in lvl %}
     {{ e.order | default: '?' }}: [{{ e.path | split:'/' | last | split:'.' | first }}: {{ e.path }}]
{%- endfor %}]
{%- assign i = i | plus:1 -%}
{%- endfor -%}
</pre>
{:.highlight }
