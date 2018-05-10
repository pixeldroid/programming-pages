---
layout: page
title: Introduction
---

# {{ page.title }}

**programming pages** is a site template for publishing documentation of code on [GitHub Pages][gh-pages]. This site is an example of the template in use.
{:.larger.text}

With this template installed in your project, you can author documentation in [Markdown][markdown-sampler] files, and rely on the template to index them for browsing and search and render them in style.

Learn more about the template in the following guides:

{% for collection in site.collections %}
{% if collection.label == 'guides' %}
{% assign doc_list = collection.docs %}
{% assign ordered = '' | split: '' %}
{% assign unorder = '' | split: '' %}
{% for doc in doc_list %}
{% if doc.order %}{% assign ordered = ordered | push: doc %}
{% else %}{% assign unorder = unorder | push: doc %}
{% endif %}
{% endfor %}
{% assign ordered = ordered | sort: 'order' %}
{% assign doc_list = ordered | concat: unorder %}
{% for doc in doc_list %}
  {% capture link %}{{ doc.title }}{% endcapture %}
  {% capture url %}{{ doc.url }}#/{{ collection.label | downcase }}/{% endcapture %}
- [{{ link }}]({{ site.baseurl }}{{ url }})
{% endfor %}
{% endif %}
{% endfor %}



[gh-pages]: https://pages.github.com/ "Websites for you and your projects"
[markdown-sampler]: {{ site.baseurl }}/examples/sampler/#/examples/ "Samples of the markdown supported by lsdoc and GitHub Pages"
