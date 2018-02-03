# programming-pages

a site template for publishing code documentation to GitHub pages

> See **programming pages** used to document itself here: https://pixeldroid.github.io/programming-pages/

- [installation](#installation)
- [usage](#usage)
- [building](#building)
- [contributing](#contributing)

<br/>

## installation

1. Download the latest [release][releases]
1. Extract it into your project under a folder of your choice (e.g. `docs/`)


## usage

1. [Configure a publishing source for GitHub Pages][ghpages-howto] so GitHub knows where to find your documentation.
1. [Author documentation][author-documentation]
1. [Push to GitHub][push-to-github]
1. Visit your documentation site at https://_&lt;username&gt;_.github.io/_&lt;project&gt;_
1. _repeat_


## building

```console
bundle install
bundle exec jekyll serve -I -s docs
open http://localhost:4000/
```


## contributing

[Pull requests][pull-requests] for improved documentation, bug fixes and useful features are all welcome. :gift_heart:



[ghpages-howto]: https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/ "How to Configure a publishing source for GitHub Pages"
[pull-requests]: https://github.com/pixeldroid/programming-pages/pulls "Pull requests for the Programming Pages template project"
[push-to-github]: https://help.github.com/articles/pushing-to-a-remote/ "Pushing to a remote"
[releases]: https://github.com/pixeldroid/programming-pages/releases "Packaged releases of the Programming Pages template"
[author-documentation]: https://pixeldroid.github.io/programming-pages/guides/Authoring-Documentation/#/guides/ "Authoring documentation using the programming pages site template"
