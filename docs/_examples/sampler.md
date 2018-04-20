---
layout: page
title: Markdown Sampler
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
| [Code](#code) | <code>&#96;</code> or <code>```</code> |
| [Tables](#tables) | `|--:|` |
| [Links](#links) | `[text](url "title")` or (`[text][id]` + `[id]: url "title"`) |
| [Images](#images) | `![alt](url "title")` or (`![alt][id]` + `[id]: url "title"`) |
| [Rules](#rules) | `---` or `***` or `___` |
| [Emoji](#emoji) | `:emoji-id:` |
| [Icons](#icons) | `<svg class="icon"><use xlink:href="#icon-id" /></svg>` |
| [Messages](#messages) | `{:.ui.<size|type>.message}` |
{:.ui.collapsing.compact.table}

</div>
{:.ui.compact.green.segment}

Each section on this page illustrates markdown syntax that can be used to author content with the **programming pages** template.
{:.larger.text}


## TOC

- TOC (this line will be replaced by the table of contents)
{::options toc_levels="2,3" /}
{:toc}


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

Using any digit followed by a period (`.`), indent each level by three spaces.

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    1. ordered item
       1. ordered item
          1. ordered item
    95. ordered item
    123. ordered item
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
123. ordered item
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

Use triple backticks (<code>```</code>), and an optional syntax hint, on lines before and after the code block to render syntax-highlighted code. Github Pages uses the [rouge highlighter][rouge-list] for syntax coloring.

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

### Anchor Links

Format: `[text](#anchor "hover text")`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    [references](#references "jump to the references section")
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
[references](#references "jump to the references section")
</div>
{:.ui.attached.secondary.segment}


### URL Links

Format: `[text](url "hover text")`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    [random Wikipedia page](http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page")
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
[random Wikipedia page](http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page")
</div>
{:.ui.attached.secondary.segment}


### Reference Links

Format: `[text][reference-id]` <br>
Reference Format: `[reference-id]: url "hover text"`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    [random Wikipedia page][reference-page]

    [reference-page]: http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page"
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
[random Wikipedia page][reference-page]
</div>
{:.ui.attached.secondary.segment}


## Images

### URL Images

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


### Reference Images

Format: `![alt text][reference-id]` <br>
Reference Format: `[reference-id]: url "hover text"`

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ![sample image][reference-image]

    [reference-image]: https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image"
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
![sample image][reference-image]
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
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
:golf::clap:
</div>
{:.ui.attached.secondary.segment}


## Icons

There is no markdown shortcut for icons, but the following are provided with the template ([svg.html][svg-file]) and can be included via regular html syntax.

Format: `<svg class="icon"><use xlink:href="#icon-id" /></svg>`

|:----:|-----------|
| <svg class="icon"><use xlink:href="#icon-bars" /></svg> | `#icon-bars` |
| <svg class="icon"><use xlink:href="#icon-cc-by" /></svg> | `#icon-cc-by` |
| <svg class="icon"><use xlink:href="#icon-cc-cc" /></svg> | `#icon-cc-cc` |
| <svg class="icon"><use xlink:href="#icon-check-circle" /></svg> | `#icon-check-circle` |
| <svg class="icon"><use xlink:href="#icon-chevron-right" /></svg> | `#icon-chevron-right` |
| <svg class="icon"><use xlink:href="#icon-exclamation-circle" /></svg> | `#icon-exclamation-circle` |
| <svg class="icon"><use xlink:href="#icon-exclamation-triangle" /></svg> | `#icon-exclamation-triangle` |
| <svg class="icon"><use xlink:href="#icon-file-outline" /></svg> | `#icon-file-outline` |
| <svg class="icon"><use xlink:href="#icon-flow-line" /></svg> | `#icon-flow-line` |
| <svg class="icon"><use xlink:href="#icon-flow-tree" /></svg> | `#icon-flow-tree` |
| <svg class="icon"><use xlink:href="#icon-folder-outline" /></svg> | `#icon-folder-outline` |
| <svg class="icon"><use xlink:href="#icon-home" /></svg> | `#icon-home` |
| <svg class="icon"><use xlink:href="#icon-info-circle" /></svg> | `#icon-info-circle` |
| <svg class="icon"><use xlink:href="#icon-interface" /></svg> | `#icon-interface` |
| <svg class="icon"><use xlink:href="#icon-magnifier" /></svg> | `#icon-magnifier` |
| <svg class="icon"><use xlink:href="#icon-star" /></svg> | `#icon-star` |

> See also [Emoji](#emoji) as another way to insert pictograms.


## Messages

Sized and/or semantically color-coded message blocks can be defined by leveraging the [block Inline Attribute List][kramdown-css] in kramdown, and the [message element][semantic-message] from Semantic UI.
Size and type can be used apart or together.
Icons are optional.

Format: `{:.ui.<size|type>.message}`, where size is any of:
- `mini`
- `tiny`
- `small`
- `large`
- `big`
- `huge`
- `massive`

and type is any of:
- `success`
- `info`
- `warning`
- `error`

### Sized message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    This text will appear as a huge message.
    {:.ui.huge.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
This text will appear as a huge message.
{:.ui.huge.message}
</div>
{:.ui.attached.secondary.segment}


### Success message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-check-circle" /></svg> <b>Success</b></span><br> This text will appear in a big success block with an icon.
    {:.ui.big.success.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-check-circle" /></svg> <b>Success</b></span><br> This text will appear in a big success block with an icon.
{:.ui.big.success.message}
</div>
{:.ui.attached.secondary.segment}


### Info message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-info-circle" /></svg> <b>Info</b></span><br> This text will appear in an info block with an icon.
    {:.ui.info.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-info-circle" /></svg> <b>Info</b></span><br> This text will appear in an info block with an icon.
{:.ui.info.message}
</div>
{:.ui.attached.secondary.segment}


### Warning message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-exclamation-triangle" /></svg> <b>Warning</b></span><br> This text will appear in a warning block with an icon.
    {:.ui.warning.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-exclamation-triangle" /></svg> <b>Warning</b></span><br> This text will appear in a warning block with an icon.
{:.ui.warning.message}
</div>
{:.ui.attached.secondary.segment}


### Error message

#### markdown
{:.ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-exclamation-circle" /></svg> <b>Error</b></span><br> This text will appear in an error block with an icon.
    {:.ui.error.message}
</div>
{:.ui.attached.secondary.tight.segment}

<br>

#### result
{:.ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-exclamation-circle" /></svg> <b>Error</b></span><br> This text will appear in an error block with an icon.
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



[emoji-cheatsheet]: https://www.webpagefx.com/tools/emoji-cheat-sheet/ "Emoji Cheat Sheet"
[gh-emoji]: https://help.github.com/articles/emoji-on-github-pages/ "Emoji on GitHub Pages"
[github-guide]: https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/ "Getting started with writing and formatting on GitHub"
[gitlab-guide]: https://about.gitlab.com/handbook/product/technical-writing/markdown-guide/ "Markdown kramdown Style Guide for about.GitLab.com"
[kramdown-syntax]: https://kramdown.gettalong.org/syntax.html "Kramdown syntax documentation"
[kramdown-css]: https://kramdown.gettalong.org/quickref.html#block-attributes "css via block Inline Attribute Lists (IALs)"
[markdown-cheatsheet]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet "Markdown Cheatsheet"
[rouge-hilighter]: http://rouge.jneen.net/ "an elegant, extendable code highlighter written in pure Ruby"
[rouge-list]: https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers "list of supported languages and lexers in Rouge"
[sampler-source]: https://raw.githubusercontent.com/pixeldroid/programming-pages/master/lib/doc/_examples/sampler.md "source code for this page"
[semantic-message]: https://semantic-ui.com/collections/message.html#warning "a message displays information that explains nearby content"
[svg-file]: https://github.com/pixeldroid/programming-pages/blob/master/lib/src/_includes/styles/svg.html "source file for SVG icons provided by default"

[reference-image]: https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image"
[reference-page]: http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page"
