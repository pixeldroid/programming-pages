# programming-pages

[installation](#installation) | [usage](#usage) | [building](#building) | [contributing](#contributing)

a site template for publishing code documentation to GitHub pages

> See **programming pages** used to document itself here: https://pixeldroid.github.io/programming-pages/

<br/>

## installation

1. Download the latest [release][releases]
1. Extract it into your project under a folder of your choice (e.g. `docs/`)


## usage

> first: <br>
> 1. [Configure a publishing source for GitHub Pages][ghpages-howto] so GitHub knows where to find your documentation.

1. [Author documentation][author-documentation]
1. [Push to GitHub][push-to-github]
1. Visit your documentation site at https://&lt;`username`&gt;.github.io/&lt;`project`&gt;
1. _repeat_


## building

**programming pages** depends on [Jekyll][jekyll], [Semantic UI][semantic], and [jQuery][jquery].
The dependencies are all captured in source control for this project,
but if you want to update a dependency or change its configuration,
you'll need to be able to build them from source.

### building the static site locally

> first: <br>
> 1. [install jekyll][jekyll-install] and the [github-pages gem][ghpages-install]: `bundle install`

```console
rake build:docs
bundle exec jekyll serve -I -s docs
open http://localhost:4000/
```

### generating the semantic ui files

> first: <br>
> 1. ensure you can [build semantic ui][semantic-build] (requires nodejs, npm, gulp): `gulp build`
> 1. check out the [programming-pages branch of the pixeldroid fork][semantic-custom] of semantic ui

```console
rake build:semantic['/path/to/programming-pages-semantic']
```

#### semantic ui modules

The Semantic UI modules required by this project are declared in `lib/semantic-build/semantic.json`.

### generating the jQuery file

> first <br>
> 1. ensure you can [build jQuery][jquery-build] (requires nodejs, grunt): `grunt default`

```console
grunt custom:-ajax,-wrap
cp /path/to/jquery/dist/jquery.min.js /path/to/programming-pages/lib/src/_includes/scripts/jquery/jquery-<version>.custom.min.js
```

Don't forget to update `lib/src/scripts/site.js` with the new filename.

#### jQuery modules

> Smaller custom subsets of the jQuery library can be built by excluding unwanted modules.
> (see https://github.com/jquery/jquery#modules)

This project excludes the following unused modules to reduce file size:

##### excluded
- `ajax`
- `wrap`

##### required
- `attr`
- `classes`
- `core`
- `css`
- `data`
- `deferred` (required for `effects`)
- `deprecated` (for Semantic UI's use of `bind`)
- `dimensions`
- `effects`
- `events`
- `filtering`
- `init`
- `manipulation`
- `offsets`
- `parseHTML`
- `prop`
- `ready`
- `traversing`
- `val`

## contributing

[Pull requests][pull-requests] for improved documentation, bug fixes and useful features are all welcome. :gift_heart:



[author-documentation]: https://pixeldroid.github.io/programming-pages/guides/Authoring-Documentation/#/guides/ "Authoring documentation using the programming pages site template"
[ghpages-howto]: https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/ "How to Configure a publishing source for GitHub Pages"
[ghpages-install]: https://github.com/github/pages-gem "GitHub Pages Ruby Gem"
[jekyll]: https://jekyllrb.com/ "Simple, blog-aware, static sites"
[jekyll-install]: https://jekyllrb.com/docs/installation/ "How to install Jekyll"
[jquery]: https://github.com/jquery/jquery#how-to-build-your-own-jquery "jQuery is a fast, small, and feature-rich JavaScript library"
[jquery-build]: https://github.com/jquery/jquery#how-to-build-your-own-jquery "How to build your own jQuery"
[pull-requests]: https://github.com/pixeldroid/programming-pages/pulls "Pull requests for the Programming Pages template project"
[push-to-github]: https://help.github.com/articles/pushing-to-a-remote/ "Pushing to a remote"
[releases]: https://github.com/pixeldroid/programming-pages/releases "Packaged releases of the Programming Pages template"
[semantic]: https://semantic-ui.com/ "Semantic is a UI component framework based around useful principles from natural language"
[semantic-build]: https://semantic-ui.com/introduction/build-tools.html "Semantic UI build tools"
[semantic-custom]: https://github.com/pixeldroid/Semantic-UI/tree/programming-pages "programming-pages branch of Semantic UI"
