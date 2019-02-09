---
layout: guide-index
title: Installing the theme
description: how to get started
order: 2

cmd_jekyll_serve: 'bundle exec jekyll serve --source ./docs --layouts ./docs/_layouts'
---

**programming pages** is a theme for Jekyll. It is a collection of files designed to be dropped into your project's documentation folder.
{:.larger.text}

As a shortcut, you can have GitHub manage the installation of theme files by [using the remote_theme key][remote-theme] in your site config file.
{:.larger.text}

- TOC (this line will be replaced by the table of contents)
{:toc}


# Usage

To use programming pages with GitHub pages, the simplest method is to require it as a remote theme in your `_config.yml` file (remove any other `theme:` or `remote_theme:` entries).

```yaml
remote_theme: pixeldroid/programming-pages
```
> See [Other installation methods](#other-installation-methods) for additional options.

Then use the theme to:

1. [Author][author] your content
1. [Publish][publish] to GitHub Pages
1. _(optionally)_ Customize the theme to taste


## Running locally

<span>{% include icon.liquid id='info-circle' %} <b>Info</b></span><br>Ruby is required to run locally. Older versions may work, but you probably want to match what [GitHub is using][pages-versions].
{: .ui.info.message}

Setting up locally for testing a GitHub pages target is best done via [Bundler][bundler]:

1. Ensure your `Gemfile` includes the following (these may be the only lines you need):

   ```ruby
   source 'https://rubygems.org'

   gem 'github-pages'
   ```

1. Retrieve dependencies into a local bundle:

   ```console
   $ bundle install
   ```

1. Build and serve the site:

   ```console
   $ {{ page.cmd_jekyll_serve }}
   ```

---

# Other installation methods

There are three ways to install the theme for your site:

1. via the jekyll-remote-theme plugin (for GitHub Pages hosting)
1. via the programming-pages Ruby gem (for self-hosted sites)
1. by downloading a release of theme files directly and adding them to your site (for capturing dependencies or making custom modifications)

### Install via remote theme

1. Ensure the [jekyll-remote-theme gem][remote-theme-gem] is part of the dependency chain of your `Gemfile` (it will be if you are requiring `github-pages >= 171`):

   ```ruby
   source 'https://rubygems.org'

   gem 'github-pages'
   ```

   ```console
   $ bundle exec gem dependency | grep 'Gem jekyll-remote-theme'
   Gem jekyll-remote-theme-0.3.1
   ```

1. Specify the remote theme gem in your `_config.yml`:

   ```yaml
   remote_theme: pixeldroid/programming-pages
   ```

1. Retrieve dependencies into a local bundle:

   ```console
   $ bundle install
   ```

1. Build and serve the site:

   ```console
   $ {{ page.cmd_jekyll_serve }}
   ```

### Install via Ruby Gem

1. Require the [programming-pages theme gem][programming-pages-gem] in your `Gemfile` (replace the github-pages dependency):

   ```ruby
   - gem 'github-pages'
   + gem 'programming-pages'
   ```

1. Specify the theme in your `_config.yml`:

   ```yaml
   theme: 'programming-pages'
   ```

1. Retrieve dependencies into a local bundle:

   ```console
   $ bundle install
   ```

1. Build and serve the site:

   ```console
   $ {{ page.cmd_jekyll_serve }}
   ```

### Install via file copy

1. Download a zipfile of a [programming pages release][releases] from GitHub:

   ```console
   $ API='https://api.github.com/repos/pixeldroid/programming-pages/releases/latest'; \
     ZIP="$(curl -sL $API | jq -r '.assets[].browser_download_url')"; \
     curl -LO $ZIP && unzip "$(basename $ZIP)"
   ```

1. Unzip it into your project's documentation folder:

   ```console
   $ mkdir -p docs && mv programming-pages/* docs/ && rmdir programming-pages
   ```

1. Build and serve the site:

   ```console
   $ {{ page.cmd_jekyll_serve }}
   ```



[author]: {{site.baseurl}}/guides/Authoring-Documentation/#/guides/ "Authoring documentation"
[bundler]: http://bundler.io/ "Manage your Ruby application's gem dependencies"
[customize]: {{site.baseurl}}/guides/Customizing/#/guides/ "Customizing the theme"
[pages-versions]: https://pages.github.com/versions/ "version dependencies for GitHub pages"
[programming-pages-gem]: https://rubygems.org/gems/programming-pages "programming pages gem on rubygems.org"
[publish]: {{site.baseurl}}/guides/Publishing-to-GitHub-Pages/#/guides/ "Publishing to GitHub Pages"
[rake-tasks]: {{site.baseurl}}/examples/Rake-tasks/#/examples/ "Rake tasks"
[releases]: https://github.com/pixeldroid/programming-pages/releases "Packaged releases of the Programming Pages template"
[remote-theme]: http://talk.jekyllrb.com/t/remote-themes-on-github-pages/1214 "announcing remote themes on github pages"
[remote-theme-gem]: https://rubygems.org/gems/jekyll-remote-theme "Jekyll plugin for building Jekyll sites with any GitHub-hosted theme"
