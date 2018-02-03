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

Format: `<i><svg class="icon"><use xlink:href="#icon-id" /></svg></i>`

|:----:|-----------|
| <i><svg class="icon"><use xlink:href="#bars" /></svg></i> | `#bars` |
| <i><svg class="icon"><use xlink:href="#cc-by" /></svg></i> | `#cc-by` |
| <i><svg class="icon"><use xlink:href="#cc-cc" /></svg></i> | `#cc-cc` |
| <i><svg class="icon"><use xlink:href="#check-circle" /></svg></i> | `#check-circle` |
| <i><svg class="icon"><use xlink:href="#chevron-right" /></svg></i> | `#chevron-right` |
| <i><svg class="icon"><use xlink:href="#exclamation-circle" /></svg></i> | `#exclamation-circle` |
| <i><svg class="icon"><use xlink:href="#exclamation-triangle" /></svg></i> | `#exclamation-triangle` |
| <i><svg class="icon"><use xlink:href="#file-outline" /></svg></i> | `#file-outline` |
| <i><svg class="icon"><use xlink:href="#flow-line" /></svg></i> | `#flow-line` |
| <i><svg class="icon"><use xlink:href="#flow-tree" /></svg></i> | `#flow-tree` |
| <i><svg class="icon"><use xlink:href="#folder-outline" /></svg></i> | `#folder-outline` |
| <i><svg class="icon"><use xlink:href="#home" /></svg></i> | `#home` |
| <i><svg class="icon"><use xlink:href="#info-circle" /></svg></i> | `#info-circle` |
| <i><svg class="icon"><use xlink:href="#interface" /></svg></i> | `#interface` |
| <i><svg class="icon"><use xlink:href="#magnifier" /></svg></i> | `#magnifier` |
| <i><svg class="icon"><use xlink:href="#star" /></svg></i> | `#star` |

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
    <i><svg class="icon"><use xlink:href="#check-circle" /></svg></i>
    This text will appear in a big success block with an icon.
    {: .ui.big.success.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<i><svg class="icon"><use xlink:href="#check-circle" /></svg></i>
This text will appear in a big success block with an icon.
{: .ui.big.success.message}
</div>
{: .ui.attached.secondary.segment}


### Info message

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <i><svg class="icon"><use xlink:href="#info-circle" /></svg></i>
    This text will appear in an info block with an icon.
    {: .ui.info.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<i><svg class="icon"><use xlink:href="#info-circle" /></svg></i>
This text will appear in an info block with an icon.
{: .ui.info.message}
</div>
{: .ui.attached.secondary.segment}


### Warning message

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <i><svg class="icon"><use xlink:href="#exclamation-triangle" /></svg></i>
    This text will appear in a warning block with an icon.
    {: .ui.warning.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<i><svg class="icon"><use xlink:href="#exclamation-triangle" /></svg></i>
This text will appear in a warning block with an icon.
{: .ui.warning.message}
</div>
{: .ui.attached.secondary.segment}


### Error message

#### markdown
{: .ui.attached.tertiary.inverted.tight.grey.segment}

<div>
    <i><svg class="icon"><use xlink:href="#exclamation-circle" /></svg></i>
    This text will appear in an error block with an icon.
    {: .ui.error.message}
</div>
{: .ui.attached.secondary.tight.segment}

<br>

#### result
{: .ui.attached.secondary.inverted.tight.blue.segment}

<div>
<i><svg class="icon"><use xlink:href="#exclamation-circle" /></svg></i> Error
This text will appear in an error block with an icon.
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
[svg-file]: https://github.com/pixeldroid/programming-pages/blob/master/lib/ghpages-template/_includes/styles/svg.html "Source file for SVG icons provided in lsdoc"

[reference-image]: https://dummyimage.com/600x400/70b7ec/000 "a 600x400 image"
[reference-page]: http://en.wikipedia.org/wiki/Special:Randompage "link to a random Wikipedia page"
