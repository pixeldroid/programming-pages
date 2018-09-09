# frozen_string_literal: true

require 'yaml'


GEM_CONFIG = YAML.load(File.read(File.expand_path('../lib/doc-source/_config.yml', __FILE__)))

Gem::Specification.new do |spec|
  spec.name     = 'programming-pages'
  spec.version  = GEM_CONFIG['project']['version']
  spec.author   = GEM_CONFIG['project']['owner']
  spec.homepage = GEM_CONFIG['project']['repo']
  spec.summary  = 'a site template for publishing code documentation to GitHub pages'
  spec.license  = 'MIT'

  spec.metadata = {
    'plugin_type'       => 'theme',
    'documentation_uri' => 'https://pixeldroid.com/programming-pages/',
    'source_code_uri'   => GEM_CONFIG['project']['repo'],
    'bug_tracker_uri'   => "#{GEM_CONFIG['project']['repo']}/issues",
  }

  spec.files = Dir[
    'CODE_OF_CONDUCT.md',
    'CONTRIBUTING.md',
    'LICENSE',
    'Rakefile',
    'README.md',
    'screenshot.png',
    'lib/source/**/*', # how to list out into different path?
  ]

  spec.add_runtime_dependency 'jekyll', '~> 3.7'
  spec.add_runtime_dependency 'jemoji', '~> 0.10'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'github-pages', '~> 191'
  spec.add_development_dependency 'rake', '~> 12.0'
end
