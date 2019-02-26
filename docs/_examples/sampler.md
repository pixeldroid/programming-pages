---
layout: page
title: Markdown Sampler
description: a reference for all the formatting conventions supported by this theme
---

{::options parse_block_html="true" /}

# {{ page.title }}

[GitHub Pages][github-guide] uses the [kramdown][kramdown-syntax] processor to render markdown, and the [rouge][rouge-hilighter] syntax highlighter to color code.
See the [References](#references) section below for links to more details.
{:.ui.info.message}


<div>

## Cheatsheet

| Element     | `Syntax` |
|------------:|:---------|
| [TOC](#toc) | `{:toc}` following a list item |
| [Headings](#headings) | `#` &hellip; `######` |
| [Breaks](#breaks) | `<br>` |
| [Spans](#spans) | `_`, `**`, `~~` |
| [Blockquotes](#blockquotes) | `>` |
| [Lists](#lists) | `*`, `+`, `-`, `1.` |
| [Code](#code) | <code class="highlighter-rouge">&#96;</code> or <code class="highlighter-rouge">```</code> |
| [Keyboard](#keyboard) | `<kdb> .. </kbd>` |
| [Tables](#tables) | `|--:|` |
| [Links](#links) | `[text](url "title")` or (`[text][id]` + `[id]: url "title"`) |
| [Images](#images) | `![alt](url "title")` or (`![alt][id]` + `[id]: url "title"`) |
| [Footnotes](#footnotes) | `[^id]` + `[^id]: content`) |
| [Rules](#rules) | `---` or `***` or `___` |
| [Emoji](#emoji) | `:emoji-id:` |
| [Icons](#icons) | {% raw %}`{% include icon.liquid id='<id>' %}`{% endraw %} |
| [Messages](#messages) | `{:.ui.<size|type>.message}` |
{:.ui.collapsing.compact.table}

</div>
{:.ui.compact.segment}

Each section on this page illustrates markdown syntax that can be used to author content with the **programming pages** theme.
{:.larger.text}


## TOC

Place the kramdown macro `{:toc}` on the line below any list item. The list item will be replaced by an auto-generated table of content list.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    - toc placeholder
    {:toc}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
- TOC (this line will be replaced by the table of contents)
{::options toc_levels="2,3" /}
{:toc}
</div>
{:.ui.attached.secondary.tight.segment}


## Headings

Prefix the heading text with 1-6 octothorpes (`#`) to indicate h1&mdash;h6.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    # Heading h1

    ## Heading h2

    ### Heading h3

    #### Heading h4

    ##### Heading h5

    ###### Heading h6
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
# Heading h1
{:.no_toc}

## Heading h2
{:.no_toc}

### Heading h3
{:.no_toc}

#### Heading h4

##### Heading h5

###### Heading h6
</div>
{:.ui.attached.secondary.segment}


## Breaks

The html break tag (`<br>`) will insert newlines.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    line1<br>line2
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
line1<br>line2
</div>
{:.ui.attached.secondary.segment}


## Spans

Surround text by decoration characters (`_`, `*`, `~`, <code>&#96;</code>).

#### markdown
{:.ui.attached.tertiary.inverted.grey.segment}

<div>
    _emphasis_ or *emphasis*

    __strong__ or **strong**

    ~~strikethrough~~

    `code`
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.blue.segment}

<div>
_emphasis_ or *emphasis*

__strong__ or **strong**

~~strikethrough~~

`code`
</div>
{:.ui.attached.secondary.segment}


## Blockquotes

Prefix the quotation text with a greater than sign (`>`). Consecutive lines will be combined.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    > blockquote line 1
    > same line, continued

    > blockquote line 2
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
> blockquote line 1
> same line, continued

> blockquote line 2
</div>
{:.ui.attached.secondary.segment}


## Lists

### Unordered Lists

Using `-`, `+`, or `*`, indent each level by three spaces.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    - unordered item
       - unordered item
          - unordered item
    + unordered item
    * unordered item
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
- unordered item
   - unordered item
      - unordered item
+ unordered item
* unordered item
</div>
{:.ui.attached.secondary.segment}


### Ordered Lists

Using any digit followed by a period (`.`), indent each level by three spaces. Actual number values are ignored.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    1. ordered item
       1. ordered item
          1. ordered item
    95. ordered item
    7. ordered item
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
1. ordered item
   1. ordered item
      1. ordered item
95. ordered item
7. ordered item
</div>
{:.ui.attached.secondary.segment}


## Code

### Inline code

Surround code phrases with backticks (<code>&#96;</code>).

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    regular `code` regular
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
regular `code` regular
</div>
{:.ui.attached.secondary.segment}


### Indented code

Indent code blocks with four spaces.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
```markdown
    code
    code
    code
```
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
    code
    code
    code
</div>
{:.ui.attached.secondary.segment}


### Fenced code

Use triple backticks (<code>```</code>) on lines before and after the code block to render syntax-highlighted code. Provide an optional syntax hint on the first line specify a specific language highlighter. Github Pages uses the [rouge highlighter][rouge-list] for syntax coloring.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ```json
    {
        "foo": "bar",
        "baz": 847,
        "bat": [true, false]
    }
    ```
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
```json
{
    "foo": "bar",
    "baz": 847,
    "bat": [true, false]
}
```
</div>
{:.ui.attached.secondary.segment}


## Keyboard

Use the `kbd` tag to indicate literal key sequences (<kbd>Esc</kbd>).

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    Select all text on the page with <kbd>Ctrl</kbd><kbd>A</kbd>.
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
Select all text on the page with <kbd>Ctrl</kbd><kbd>A</kbd>.
</div>
{:.ui.attached.secondary.segment}


## Tables

Surround columns with pipes (`|`). Provide a header separator row of hyphens (`-`), with optional alignment colons (`:`).

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    | Column A | Column B  | Column C |
    |----------|:---------:|---------:|
    | left     | center    | right    |
    | left     | center    | right    |
    | left     | center    | right    |
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>

| Column A | Column B  | Column C |
|----------|:---------:|---------:|
| left     | center    | right    |
| left     | center    | right    |
| left     | center    | right    |
{:.ui.collapsing.striped.table}

</div>
{:.ui.attached.secondary.segment}


## Links

### Inline URL Links

Format: `[text](url "hover text")` or `[text](#anchor "hover text")`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    - [random Wikipedia page](http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page")
    - [references](#references "jump to the references section")
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
- [random Wikipedia page](http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page")
- [references](#references "jump to the references section on this page")
</div>
{:.ui.attached.secondary.segment}


### Reference URL Links

Format: `[text][reference-id]` <br>
Reference Format: `[reference-id]: url "hover text"`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    - [random Wikipedia page][random-page]
    - [references]

    [random-page]: http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page"
    [references]: #references "jump to the references section on this page"
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
- [random Wikipedia page][random-page]
- [references]
</div>
{:.ui.attached.secondary.segment}


## Images

### Inline Image Links

Format: `![alt text](url "hover text")`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ![sample image](https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image")
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
![sample image](https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image")
</div>
{:.ui.attached.secondary.segment}


### Reference Image Links

Format: `![alt text][reference-id]` <br>
Reference Format: `[reference-id]: url "hover text"`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ![sample image][dummy-image]

    [dummy-image]: https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image"
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
![sample image][dummy-image]
</div>
{:.ui.attached.secondary.segment}


## Footnotes

Marker format: `[^id]` <br>
Note format: `[^id]: content`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    Footnote markers must be numbers or word characters in square brackets.[^1] Traditional symbols[^2] will not work with the kramdown processor.

    The backlink character (`{{ site.kramdown.footnote_backlink}}`) is configurable via `kramdown.footnote_backlink` in `_config.yml`.[^3]
    The programming pages theme chooses unicode code point `U+2B8C` for this, and supplies its own webfont to ensure cross-platform rendering.
    Kramdown's default value is `U+21A9` (`↩`).[^4]

    Footnotes are collected and all rendered at the end of the page, with the optional backlink character linking back to the citing text.

    [^1]: A footnote marker can be created by placing the footnote name in square brackets. The footnote name has to start with a caret (`^`), followed by a word character or a digit and then optionally followed by other word characters, digits or dashes. For example: `This is some text.[^1]. Other text.[^footnote].` (from: [Kramdown syntax documentation {% include icon.liquid id='external-link' class='smaller text' %}](https://kramdown.gettalong.org/syntax.html#footnotes) ).
    [^2]: Typographical devices such as the asterisk (*) or dagger (†) may also be used to point to footnotes; the traditional order of these symbols in English is *, †, ‡, §, ‖, ¶. (from: [Wikipedia description of footnotes {% include icon.liquid id='external-link' class='smaller text' %}](https://en.wikipedia.org/w/index.php?title=Note_(typography)&oldid=871967408) ).
    [^3]: `footnote_backlink` defines the text that will link back to the footnote marker. The footnote backlink is just text, so any special HTML characters will be escaped. If the footnote backlink text is an empty string, no footnote backlinks will be generated. (from: [Kramdown configuration options {% include icon.liquid id='external-link' class='smaller text' %}](https://kramdown.gettalong.org/options.html#option-footnote-backlink) ).
    [^4]: Default value for `footnote_backlink` is `&8617;`, i.e. unicode codepoint `U+21A9`. It can be set to any text, or the empty string to disable (from: [Kramdown syntax documentation {% include icon.liquid id='external-link' class='smaller text' %}](https://kramdown.gettalong.org/options.html#option-footnote-backlink) ).
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
Footnote markers must be numbers or word characters in square brackets.[^1] Traditional symbols[^2] will not work with the kramdown processor.

The backlink character (`{{ site.kramdown.footnote_backlink}}`{:.reversefootnote}) is configurable via `kramdown.footnote_backlink` in `_config.yml`.[^3]
The programming pages theme chooses unicode code point `U+2B8C` for this, and supplies its own webfont to ensure cross-platform rendering.
Kramdown's default value is `U+21A9` (`↩`).[^4]

Footnotes are collected and all rendered at the end of the page, with the optional backlink character linking back to the citing text.

[^1]: A footnote marker can be created by placing the footnote name in square brackets. The footnote name has to start with a caret (`^`), followed by a word character or a digit and then optionally followed by other word characters, digits or dashes. For example: `This is some text.[^1]. Other text.[^footnote].` (from: [Kramdown syntax documentation {% include icon.liquid id='external-link' class='smaller text' %}](https://kramdown.gettalong.org/syntax.html#footnotes) ).
[^2]: Typographical devices such as the asterisk (*) or dagger (†) may also be used to point to footnotes; the traditional order of these symbols in English is *, †, ‡, §, ‖, ¶. (from: [Wikipedia description of footnotes {% include icon.liquid id='external-link' class='smaller text' %}](https://en.wikipedia.org/w/index.php?title=Note_(typography)&oldid=871967408) ).
[^3]: `footnote_backlink` defines the text that will link back to the footnote marker. The footnote backlink is just text, so any special HTML characters will be escaped. If the footnote backlink text is an empty string, no footnote backlinks will be generated. (from: [Kramdown configuration options {% include icon.liquid id='external-link' class='smaller text' %}](https://kramdown.gettalong.org/options.html#option-footnote-backlink) ).
[^4]: Default value for `footnote_backlink` is `&8617;`, i.e. unicode codepoint `U+21A9`. It can be set to any text, or the empty string to disable (from: [Kramdown syntax documentation {% include icon.liquid id='external-link' class='smaller text' %}](https://kramdown.gettalong.org/options.html#option-footnote-backlink) ).
</div>
{:.ui.attached.secondary.segment}


## Rules

Use three consecutive hyphens (`-`), asterisks (`*`), or underscores (`_`), on a line alone.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ---
    ***
    ___
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
---
***
___
</div>
{:.ui.attached.secondary.segment}


## Emoji

> The `jemoji` plugin must be activated to [enable emoji rendering][gh-emoji]. Plugins are specified in `_config.xml`.

Place an emoji id inside colons (`:id:`). Reference an [emoji cheat sheet][emoji-cheatsheet] for a full list of ids.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    :golf::clap:
    {:.ui.huge}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
:golf::clap:
{:.ui.huge}
</div>
{:.ui.attached.secondary.segment}


## Icons

There is no markdown shortcut for icons, but the theme provides a liquid macro for embedding svg icons that have been defined in [_data/svg_icons.yml][svg-file].

> Users may also define icons of their own, simply by adding additional icon data files under `_data/icons/`.

Format: {% raw %}`{% include icon.liquid id='star' %}`{% endraw %} will render as: {% include icon.liquid id='star' %}

The following icons were loaded during the building of this site:

|:----:|-----------|
{% for set in site.data.icons -%}
| | _**{{ set[0] }}**_ |
  {% assign icons = set[1] | sort -%}
  {% for icon in icons %}
    {%- assign id  = icon[0] -%}
    {%- assign svg = icon[1] -%}
| <svg version="1.1" class="icon" role="img" aria-hidden="true" viewBox="{{ svg.viewbox }}"><path d="{{ svg.path }}"/></svg> | `{{ id }}` |
  {% endfor %}
{% endfor %}

> See also [Emoji](#emoji) as another way to insert pictograms.


## Messages

Sized and/or semantically color-coded message blocks can be defined by leveraging the [block Inline Attribute List][kramdown-css] in kramdown, and the [message element][semantic-message] from Semantic UI.
Size and type can be used apart or together.
Icons are optional.

Format: `{:.ui.<size|type>.message}`, where `size` is any of:
- `mini`
- `tiny`
- `small`
- `large`
- `big`
- `huge`
- `massive`

and `type` is any of:
- `success`
- `info`
- `warning`
- `error`

### Sized message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    This text will appear as a **<size>** message. :speech_balloon:
    {:.ui.huge.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
This text will appear as a **mini** message. :speech_balloon:
{:.ui.mini.message}

This text will appear as a **tiny** message. :speech_balloon:
{:.ui.tiny.message}

This text will appear as a **small** message. :speech_balloon:
{:.ui.small.message}

This is a plain message with no size specified. :speech_balloon:
{:.ui.message}

This text will appear as a **large** message. :speech_balloon:
{:.ui.large.message}

This text will appear as a **big** message. :speech_balloon:
{:.ui.big.message}

This text will appear as a **huge** message. :speech_balloon:
{:.ui.huge.message}

This text will appear as a **massive** message. :speech_balloon:
{:.ui.massive.message}
</div>
{:.ui.attached.secondary.segment}


### Success message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span>{% raw %}{% include icon.liquid id='check-circle' %}{% endraw %} <b>Success</b></span><br> This text will appear in a big success block with an icon.
    {:.ui.big.success.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span>{% include icon.liquid id='check-circle' %} <b>Success</b></span><br> This text will appear in a big success block with an icon.
{:.ui.big.success.message}
</div>
{:.ui.attached.secondary.segment}


### Info message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span>{% raw %}{% include icon.liquid id='info-circle' %}{% endraw %} <b>Info</b></span><br> This text will appear in an info block with an icon.
    {:.ui.info.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span>{% include icon.liquid id='info-circle' %} <b>Info</b></span><br> This text will appear in an info block with an icon.
{:.ui.info.message}
</div>
{:.ui.attached.secondary.segment}


### Warning message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span>{% raw %}{% include icon.liquid id='exclamation-triangle' %}{% endraw %} <b>Warning</b></span><br> This text will appear in a warning block with an icon.
    {:.ui.warning.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span>{% include icon.liquid id='exclamation-triangle' %} <b>Warning</b></span><br> This text will appear in a warning block with an icon.
{:.ui.warning.message}
</div>
{:.ui.attached.secondary.segment}


### Error message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span>{% raw %}{% include icon.liquid id='exclamation-circle' %}{% endraw %} <b>Error</b></span><br> This text will appear in an error block with an icon.
    {:.ui.error.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span>{% include icon.liquid id='exclamation-circle' %} <b>Error</b></span><br> This text will appear in an error block with an icon.
{:.ui.error.message}
</div>
{:.ui.attached.secondary.segment}


{::options parse_block_html="false" /}


## References

- [Emoji Cheat Sheet][emoji-cheatsheet]
- [GitHub's Markdown Guide][github-guide]
- [GitLab's Markdown Guide][gitlab-guide]
- [Kramdown Syntax Documentation][kramdown-syntax]
- [Markdown Cheatsheet][markdown-cheatsheet]
- [Rouge Supported Languages][rouge-list]

> view the source for this page at [sampler.md][sampler-source]. <br>
> it is more complicated than typical, in order to format the source and result blocks nicely.


<br> <br>

---

##### _footnotes_



[emoji-cheatsheet]: https://www.webpagefx.com/tools/emoji-cheat-sheet/ "Emoji Cheat Sheet"
[gh-emoji]: https://help.github.com/articles/emoji-on-github-pages/ "Emoji on GitHub Pages"
[github-guide]: https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/ "Getting started with writing and formatting on GitHub"
[gitlab-guide]: https://about.gitlab.com/handbook/product/technical-writing/markdown-guide/ "Markdown kramdown Style Guide for about.GitLab.com"
[kramdown-syntax]: https://kramdown.gettalong.org/syntax.html "Kramdown syntax documentation"
[kramdown-css]: https://kramdown.gettalong.org/quickref.html#block-attributes "css via block Inline Attribute Lists (IALs)"
[markdown-cheatsheet]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet "Markdown Cheatsheet"
[rake-tasks]: {{site.baseurl}}/examples/Rake-tasks/#/examples/ "rake tasks provided by the theme"
[dummy-image]: https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image"
[random-page]: http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page"
[references]: #references "jump to the references section on this page"
[rouge-hilighter]: http://rouge.jneen.net/ "an elegant, extendable code highlighter written in pure Ruby"
[rouge-list]: https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers "list of supported languages and lexers in Rouge"
[sampler-source]: https://raw.githubusercontent.com/pixeldroid/programming-pages/master/lib/doc-source/_examples/sampler.md "source code for this page"
[semantic-message]: https://semantic-ui.com/collections/message.html#warning "a message displays information that explains nearby content"
[svg-file]: https://github.com/pixeldroid/programming-pages/blob/master/lib/source/_data/icons/theme.yml "source file for SVG icons provided by default"
