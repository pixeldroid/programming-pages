---
layout: page
title: Introduction
---

# {{ page.title }}

**programming pages** is a site template for publishing documentation of code on [GitHub Pages][gh-pages]. This site is an example of the template in use, rendering the markdown files found [here][site-source].
{:.larger.text}

With this template installed in your project, you can author documentation in [Markdown][markdown-sampler] files, and rely on the template to index them for browsing and search and render them in style.

Learn more about the template in the following guides:

{% assign collection = site.collections | where: 'label','guides' | first %}
{% assign doc_list = collection.docs %}
{% assign top_level = '' | split: '' %}
{% assign ordered = '' | split: '' %}
{% assign unorder = '' | split: '' %}

{% for doc in doc_list %}
  {% assign depth = doc.path | split: '/' | size | minus: 2 %}
  {% if depth == 0 %}
    {% if doc.order %}{% assign ordered = ordered | push: doc %}
    {% else %}{% assign unorder = unorder | push: doc %}
    {% endif %}
  {% endif %}
{% endfor %}
{% assign ordered = ordered | sort: 'order' %}
{% assign top_level = ordered | concat: unorder %}

{% for doc in top_level %}
  {% capture link %}{{ doc.title }}{% endcapture %}
  {% capture url %}{{ doc.url }}#/{{ collection.label | downcase }}/{% endcapture %}
- [{{ link }}]({{ site.baseurl }}{{ url }})
{% endfor %}



[gh-pages]: https://pages.github.com/ "Websites for you and your projects"
[markdown-sampler]: {{ site.baseurl }}/examples/sampler/#/examples/ "Samples of the markdown supported by lsdoc and GitHub Pages"
[site-source]: https://github.com/pixeldroid/programming-pages/tree/master/lib/doc-source "Source files for programming pages documentation"
