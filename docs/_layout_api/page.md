---
layout: "layout"

title: "page"
description: |
  `page` is designed to be inherited from. It is generally the layout that any new custom pages should use, in order to take advantage of [theme features](../../guides/Theme-Features/#/guides/).

  The layout accepts an `order` parameter, to specify a relative value that is used to sort against sibling pages in the same collection.

  Other optional parameters include `description`, `category`, and `search_tags`, which are used when displaying search results (see [Search input]).

  [Search input]: ../../guides/Theme-Features/#search-input
parent_layout: [ "base", "compress" ]
parameters:
  - { name: "order", type: "string", optional: true, description: "ordinal to be used for sorting. Positive numbers will be sorted first, in ascending order, with `0` the first possible value. Negative numbers will be sorted last, in ascending order, with `-1` the last possible integer value:\n```\n🡯first       last🡮\n0 1 2 3  .. -3 -2 -1\n```\nPages without an `order` value will fall in between, sorted alphabetically by filename (not title). Ordering comparisons are only performed between siblings (files in the same folder), not across parent-child levels." }
  - { name: "description", type: "string", optional: true, description: "description to be used in search results (first 7 words will display)" }
  - { name: "category", type: "string", optional: true, description: "category label to be used in search results display" }
  - { name: "search_tags", type: "string", optional: true, description: "additional search terms to find this page by" }
---
