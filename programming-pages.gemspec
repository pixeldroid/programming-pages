# frozen_string_literal: true

require 'yaml'


GEM_CONFIG = YAML.load(File.read(File.expand_path('../build/doc-source/_config.yml', __FILE__)))

Gem::Specification.new do |gem|
  gem.name     = 'programming-pages'
  gem.version  = GEM_CONFIG['project']['version']
  gem.author   = GEM_CONFIG['project']['owner']
  gem.homepage = GEM_CONFIG['project']['repo']
  gem.summary  = 'a site template for publishing code documentation to GitHub pages'
  gem.license  = 'MIT'

  gem.metadata = {
    'plugin_type'       => 'theme',
    'documentation_uri' => 'https://pixeldroid.com/programming-pages/',
    'source_code_uri'   => GEM_CONFIG['project']['repo'],
    'bug_tracker_uri'   => "#{GEM_CONFIG['project']['repo']}/issues",
  }

  gem.files = Dir[
    '_config.yml',
    '_data/**/*',
    '_includes/**/*',
    '_layouts/**/*',
    '_tasks/**/*',
    'assets/**/*',
    'favicon.png',
    'index.md',
  ]
  gem.files += %w(
    LICENSE
    CONTRIBUTING.md CODE_OF_CONDUCT.md
    README.md screenshot.png
  )

  gem.add_runtime_dependency 'jekyll', '~> 3.7'
  gem.add_runtime_dependency 'jemoji', '~> 0.10'

  gem.add_development_dependency 'bundler', '~> 1.16'
  gem.add_development_dependency 'github-pages', '~> 191'
  gem.add_development_dependency 'rake', '~> 12.0'
end
