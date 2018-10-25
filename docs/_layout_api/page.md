---
layout: "layout"

title: "page"
description: |
  `page` is designed to be inherited from. It is generally the layout that any new custom pages should use, in order to take advantage of [theme features](../../guides/Theme-Features/#/guides/).

  The layout accepts a single `order` parameter, to specify a relative value that is used to sort against sibling pages in the same collection.
parent_layout: [ "base", "compress" ]
parameters:
  - { name: "order", type: "string", optional: true, description: "ordinal to be used for sorting. Positive numbers will be sorted first, in ascending order, with `0` the first possible value. Negative numbers will be sorted last, in descending order, with `-1` the last possible integer value:\n```\nfirst » .. «  last\n0 1 2 » .. « -2 -1\n```\nPages without an `order` value will fall in between, sorted alphabetically by filename (not title). Ordering comparisons are only performed between siblings (files in the same folder), not across parent-child levels." }
---
