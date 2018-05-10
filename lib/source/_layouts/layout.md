---
# expects the following variables set by the calling page:
#   title (string) - filename of layout, without extension
#   description (string) - purpose of layout
#   parent_layout (string) - name of layout page
#   parameters (array of objects with name and description properties) - list of supported variable
layout: "page"
content_param: { name: "content", type: "string", description: "auto-populated variable representing the page content being passed to the layout." }
---

{% capture newline %}
{% endcapture %}

{% capture md %}
# {{ page.title }}

{% assign lines = page.description | split: newline %}

{{ lines.first }}
{:.larger.text}

{%- for line in lines offset:1 -%}
{{ line }}
{% endfor %}


## Usage

```yaml
---
layout: "{{ page.title }}"
{% if page.parameters %}
{% assign params = page.parameters | sort: 'name' -%}
{%- for p in params -%}
{{ p.name }}: {{ p.type }}
{% endfor -%}{%- endif -%}
---
<content>
```

## Parent layout

**TODO** link this to the appropriate layout, maybe style like an ancestor from type layout.

{{ page.parent_layout }}


## Parameters

{% assign params = "" | split: "" | push: layout.content_param %}
{% if page.parameters %}
    {% for p in page.parameters %}
        {% assign params = params | push: p %}
    {% endfor %}
{% endif %}

{% assign params = params | sort: 'name' %}
{% for p in params %}
* `{{ p.name }}` &mdash; {% if p.optional %}_(optional)_ {% endif %}{{ p.description }}
{% endfor %}

{% endcapture %}
{{ md | markdownify }}
