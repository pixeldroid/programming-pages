---
layout: page
title: Site build info
description: attributions for work used in this theme
order: -1
---

# {{ page.title }}

built {{ site.time | date_to_rfc822 }}
{:.ui.basic.label}

## site.attributions

> &nbsp; :love_letter: &nbsp; many thanks to the authors of the projects below that make this theme feasible

{% for a in site.attributions %}{% assign b = a[1] | split: ', ' %}
- **{{ a[0] }}** : _{{ b | first }}_, <{{ b | last }}>
{% endfor%}
