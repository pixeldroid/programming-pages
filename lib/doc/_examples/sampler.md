---
layout: page
title: Markdown Sampler
---


# {{ page.title }}

[GitHub Pages][github-guide] uses the [kramdown][kramdown-syntax] processor to render markdown.
See the [References](#references) section below for links to more details.
{: .ui.info.message}

Each section on this page illustrates markdown syntax that can be used to author content in this template.

- TOC
{::options toc_levels="2,3" /}
{:toc}

{::options parse_block_html="true" /}

## Headings

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    # Heading h1

    ## Heading h2

    ### Heading h3

    #### Heading h4

    ##### Heading h5

    ###### Heading h6
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

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
{: .ui.attached.secondary.segment}


## Text decoration

#### markdown
{: .ui.attached.tertiary.inverted.grey.segment}

<div>
    _emphasis_ or *emphasis*

    __strong__ or **strong**

    ~~strikethrough~~

    `code`
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.blue.segment}

<div>
_emphasis_ or *emphasis*

__strong__ or **strong**

~~strikethrough~~

`code`
</div>
{: .ui.attached.secondary.segment}


## Blockquotes

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    > blockquote
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
> blockquote
</div>
{: .ui.attached.secondary.segment}


## Lists

### Unordered Lists

Using `-` or `*`, indent each level by three spaces.

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    - unordered item
       - unordered item
          - unordered item
    - unordered item
    - unordered item
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
- unordered item
   - unordered item
      - unordered item
- unordered item
- unordered item
</div>
{: .ui.attached.secondary.segment}


### Ordered Lists

Using any digit followed by a period (`.`), indent each level by three spaces.

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    1. ordered item
       1. ordered item
          1. ordered item
    1. ordered item
    1. ordered item
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
1. ordered item
   1. ordered item
      1. ordered item
1. ordered item
1. ordered item
</div>
{: .ui.attached.secondary.segment}


## Code

### Inline code

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    regular `code` regular
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
regular `code` regular
</div>
{: .ui.attached.secondary.segment}


### Indented code

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
```markdown
    code
    code
    code
```
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
    code
    code
    code
</div>
{: .ui.attached.secondary.segment}


### Fenced code

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ```json
    {
        "foo": "bar",
        "baz": 847
    }
    ```
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
```json
{
    "foo": "bar",
    "baz": 847
}
```
</div>
{: .ui.attached.secondary.segment}


## Tables

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    | Column A | Column B  | Column C |
    |----------|:---------:|---------:|
    | left     | center    | right    |
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

| Column A | Column B  | Column C |
|----------|:---------:|---------:|
| left     | center    | right    |
{: .ui.attached.secondary.segment}


## Links

### Anchor Links

Format: `[text](#anchor "hover text")`

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    [references](#references "jump to the references section")
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
[references](#references "jump to the references section")
</div>
{: .ui.attached.secondary.segment}


### URL Links

Format: `[text](url "hover text")`

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    [random Wikipedia page](http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page")
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
[random Wikipedia page](http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page")
</div>
{: .ui.attached.secondary.segment}


### Reference Links

Format: `[text][reference-id]` <br>
Reference Format: `[reference-id]: url "hover text"`

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    [random Wikipedia page][reference-page]

    [reference-page]: http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page"
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
[random Wikipedia page][reference-page]
</div>
{: .ui.attached.secondary.segment}


## Images

### URL Images

Format: `![alt text](url "hover text")`

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ![sample image](https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image")
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
![sample image](https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image")
</div>
{: .ui.attached.secondary.segment}


### Reference Images

Format: `![alt text][reference-id]` <br>
Reference Format: `[reference-id]: url "hover text"`

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    ![sample image][reference-image]

    [reference-image]: https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image"
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
![sample image][reference-image]
</div>
{: .ui.attached.secondary.segment}


## Emoji

> The `jemoji` plugin must be activated to [enable emoji rendering][gh-emoji]. Plugins are specified in `_config.xml`.

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    :thumbsup:
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
:thumbsup:
</div>
{: .ui.attached.secondary.segment}


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

Format: `{: .ui.<size|type>.message}`, where size is any of:
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
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    This text will appear as a huge message.
    {: .ui.huge.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
This text will appear as a huge message.
{: .ui.huge.message}
</div>
{: .ui.attached.secondary.segment}


### Success message

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-check-circle" /></svg></span> This text will appear in a big success block with an icon.
    {: .ui.big.success.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-check-circle" /></svg></span> This text will appear in a big success block with an icon.
{: .ui.big.success.message}
</div>
{: .ui.attached.secondary.segment}


### Info message

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-info-circle" /></svg></span> This text will appear in an info block with an icon.
    {: .ui.info.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-info-circle" /></svg></span> This text will appear in an info block with an icon.
{: .ui.info.message}
</div>
{: .ui.attached.secondary.segment}


### Warning message

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-exclamation-triangle" /></svg></span> This text will appear in a warning block with an icon.
    {: .ui.warning.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-exclamation-triangle" /></svg></span> This text will appear in a warning block with an icon.
{: .ui.warning.message}
</div>
{: .ui.attached.secondary.segment}


### Error message

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <span><svg class="icon"><use xlink:href="#icon-exclamation-circle" /></svg></span> This text will appear in an error block with an icon.
    {: .ui.error.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<span><svg class="icon"><use xlink:href="#icon-exclamation-circle" /></svg></span> This text will appear in an error block with an icon.
{: .ui.error.message}
</div>
{: .ui.attached.secondary.segment}


{::options parse_block_html="false" /}


## References

- [Emoji Cheat Sheet][emoji-cheatsheet]
- [GitHub's Markdown Guide][github-guide]
- [GitLab's Markdown Guide][gitlab-guide]
- [Kramdown Syntax Documentation][kramdown-syntax]
- [Markdown Cheatsheet][markdown-cheatsheet]

> view the source for this page at [sampler.md][sampler-source]. <br>
> it is more complicated than typical, in order to format the source and result blocks nicely.



[emoji-cheatsheet]: https://www.webpagefx.com/tools/emoji-cheat-sheet/ "Emoji Cheat Sheet"
[gh-emoji]: https://help.github.com/articles/emoji-on-github-pages/ "Emoji on GitHub Pages"
[github-guide]: https://guides.github.com/features/mastering-markdown/ "Mastering Markdown"
[gitlab-guide]: https://about.gitlab.com/handbook/product/technical-writing/markdown-guide/ "Markdown kramdown Style Guide for about.GitLab.com"
[kramdown-syntax]: https://kramdown.gettalong.org/syntax.html "kramdown syntax documentation"
[kramdown-css]: https://kramdown.gettalong.org/quickref.html#block-attributes "css via block Inline Attribute Lists (IALs)"
[markdown-cheatsheet]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet "Markdown Cheatsheet"
[sampler-source]: https://github.com/pixeldroid/programming-pages/blob/master/doc/examples/sampler.md "source code for this page"
[semantic-message]: https://semantic-ui.com/collections/message.html#warning "A message displays information that explains nearby content"
[svg-file]: https://github.com/pixeldroid/programming-pages/blob/master/lib/src/_includes/styles/svg.html "Source file for SVG icons provided by default"

[reference-image]: https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image"
[reference-page]: http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page"
