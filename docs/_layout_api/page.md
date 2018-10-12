---
layout: "layout"

title: "page"
description: |
  The `page` template is designed to be inherited from. It is generally the layout that any new custom pages should use, in order to take advantage of the **programming pages** features.

  It accepts a single order parameter, to specify a relative value that is used to sort against sibling pages in the same collection.

  See [theme features](../../guides/Theme-Features/#/guides/) for details of the different elements.

  **FIXME:** Provides an insertion point for users to override theme variables, or introduce their own.

  To do so, create a `_layouts` directory, put a copy of [`user-vars.html`]() in it, and declare values in it.

  Any value declared in theme-vars can be overridden by declaring it in user-vars.

  For example, users can add their own icon sets in addition to what the theme provides, by defining a `user.icons` object:
  ```yaml
  user:
    icons:
      user-icon1:
        viewbox: '<viewbox coordinates>'
        path: '<svg path data>'
      user-icon2:
        viewbox: '<viewbox coordinates>'
        path: '<svg path data>'
  ```

  [SVG Icon](https://leungwensen.github.io/svg-icon/) is a great aggregation of openly licensed icon data.
parent_layout: [ "base", "compress" ]
parameters:
  - { name: "order", type: "string", optional: true, description: "ordinal to be used for sorting. Positive numbers will be sorted first, in ascending order, with `0` the first possible value. Negative numbers will be sorted last, in descending order, with `-1` the last possible integer value (whichever value is closest to, but less than, zero will be last). Pages without an `order` value will fall in between, sorted alphabetically by filename (not title). Only applies to guides; all other collections are sorted alphabetically by filename. Ordering comparisons are only performed between siblings (files in the same folder), not across parent-child levels." }
---
