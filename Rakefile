# encoding: utf-8

require 'fileutils'
require 'json'
require 'pathname'
require 'rake/clean'
require "rubygems"
require 'tmpdir'
require 'yaml'

EXIT_OK = 0
FRONT_MATTER_REGEX = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m # https://github.com/jekyll/jekyll/blob/1ac9c21956ed7e31be6fd8f0083f6414b6220684/lib/jekyll/document.rb#L10

PROJECT = 'programming-pages'
PROJECT_OWNER = 'pixeldroid'
PROJECT_ROOT = File.dirname(__FILE__)

GEM = "#{PROJECT}.gem" # actual filename will have version in it; this will cause build of gem every time (intentional)
GEMSPEC = "#{PROJECT}.gemspec"


def exec_with_echo(cmd)
  puts(cmd)
  stdout = %x[#{cmd}]
  puts(stdout) unless stdout.empty?
  $?.exitstatus
end

def fail(message)
  # win-safe:      desired:
  #  √ - \u221A     ✓ - \u2713
  #  × - \u00D7     ✘ - \u2718
  abort("× #{message}")
end

def try(cmd, failure_message)
  fail(failure_message) if (exec_with_echo(cmd) != EXIT_OK)
end

def read_yaml(file)
  File.file?(file) ? YAML.load(File.read(file)) : {}
end

def write_yaml(file, config)
  IO.write(file, config.to_yaml)
end

def update_front_matter(file, data)
  return 0 unless File.file?(file)

  contents = File.read(file)
  if contents =~ FRONT_MATTER_REGEX
    front_matter = YAML.load(Regexp.last_match(0))
    file_remains = Regexp.last_match.post_match
    front_matter = front_matter.merge(data)
    return IO.write(file, front_matter.to_yaml + "---\n\n" + file_remains)
  end

  return 0
end

def path_to_exe(cmd)
  # from https://stackoverflow.com/a/5471032
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']

  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each do |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    end
  end

  return nil
end

def relative_path(source, target)
  Pathname(target).relative_path_from(Pathname(source)).to_s
end

def windows?
  return true if RbConfig::CONFIG['host_os'] =~ /mingw|mswin/
  false
end

def osx?
  return true if RbConfig::CONFIG['host_os'] =~ /darwin/
  false
end

def linux?
  return true if RbConfig::CONFIG['host_os'] =~ /linux/
  false
end

def cp_src(dst_dir)
  @spec.files.each do |f|
    fa = File.join(PROJECT_ROOT, f)
    next unless File.file?(fa)

    fb = File.join(dst_dir, f)
    FileUtils.mkdir_p(File.dirname(fb))
    FileUtils.cp(fa, fb)
  end
end

def docs_dir
  File.join(PROJECT_ROOT, 'docs')
end

def exclusions
  [
    '*.DS_Store',
  ]
end

def jekyll_cmd(verb)
  "bundle exec jekyll #{verb} --source #{docs_dir} --layouts #{docs_dir}/_layouts"
end

def jekyll_build
  jekyll_cmd('build')
end

def jekyll_watch
  jekyll_cmd('serve --watch --incremental')
end

def jekyll_serve_only
  "bundle exec jekyll serve --skip-initial-build --no-watch"
end

def lib_version
  @spec.version
end

def load_spec
  Gem::Specification::load(GEMSPEC)
end

def layout_version_file
  File.join(PROJECT_ROOT, '_layouts', 'page.html')
end

def project_config_file
  File.join(PROJECT_ROOT, 'docs', '_config.yml')
end

def semantic_build_dir
  File.join(PROJECT_ROOT, 'build', 'semantic')
end

def semantic_attribution(version)
  [
    '/*!',
    "* Semantic UI #{version}",
    '* http://github.com/semantic-org/semantic-ui/',
    '* http://opensource.org/licenses/MIT',
    "*/\n",
  ].join("\n")
end

def set_theme(config_file, local_or_remote)
  config = read_yaml(config_file)

  case local_or_remote
  when 'local'
    config.delete('remote_theme')
    config['theme'] = PROJECT
  when 'remote'
    config.delete('theme')
    config['remote_theme'] = "#{PROJECT_OWNER}/#{PROJECT}"
  else
    fail("invalid value '#{local_or_remote}' (expected 'local' or 'remote')")
  end

  write_yaml(config_file, config)
end

def update_lib_version(config_file, new_value)
  # update config and write to file
  config = read_yaml(config_file)
  config['project']['version'] = new_value
  write_yaml(config_file, config)

  # refresh spec since version changed
  @spec = load_spec()
end

@spec = load_spec()


[
  "#{PROJECT}*.gem",
  "#{PROJECT}*.zip",
].each { |f| CLEAN.include(f) }
Rake::Task[:clean].clear_comments()
Rake::Task[:clean].add_description([
  "removes intermediate files to ensure a clean build",
  "running now would delete the following:\n  #{CLEAN.resolve.join("\n  ")}",
].join("\n"))

[
  '_site',
].each { |f| CLOBBER.include(f) }
Rake::Task[:clobber].clear_comments()
Rake::Task[:clobber].add_description([
  "removes all generated artifacts to restore project to checkout-like state",
  "removes the following folders:\n  #{CLOBBER.join("\n  ")}",
].join("\n"))

file GEM do |t, args|
  puts "[file] creating #{t.name}..."

  cmd = "bundle exec gem build #{GEMSPEC}"
  try(cmd, 'unable to create .gem')
end

task :default => [:list_targets]

task :list_targets do |t, args|
  a = "#{PROJECT} v#{lib_version} Rakefile"
  b = "running on Ruby #{RUBY_VERSION}"
  puts "#{a} #{b}"
  system('rake -T')
end


desc [
  "calls jekyll to generate, serve, watch and regenerate the docs site",
  "  cmd: #{jekyll_watch}",
].join("\n")
task :docs do |t, args|
  begin                 # run jekyll
    puts jekyll_watch
    system(jekyll_watch)
  rescue Exception => e # capture interrupt signal from the process
    puts ' (stop)'
  end
end

desc [
  "calls jekyll to [just] generate the docs site",
  "  cmd: #{jekyll_build}",
].join("\n")
task :docs_build do |t, args|
  try(jekyll_build, 'unable to create docs')
  puts "[#{t.name}] task completed, find updated docs in ./_site"
end

desc [
  "regenerate the theme and docs from scratch",
  " uses local theme",
  " runs clobber first",
].join("\n")
task :docs_regen => ['clobber', 'gem_local', 'theme_local', 'docs']

desc [
  "calls jekyll to serve the docs site, without first building it",
  "  cmd: #{jekyll_serve_only}",
].join("\n")
task :docs_serve do |t, args|
  begin                 # run jekyll
    puts jekyll_serve_only
    system(jekyll_serve_only)
  rescue Exception => e # capture interrupt signal from the process
    puts ' (stop)'
  end
end

desc [
  "packages #{PROJECT} files for release as a ruby gem",
  "the gem is built from #{PROJECT}.gemspec",
].join("\n")
task :gem => [GEM] do |t, args|
  puts "[#{t.name}] task completed, find gem in ./"
end

desc [
  "builds gem and installs locally",
  "this is handy for iterating on changes",
].join("\n")
task :gem_local => [GEM] do |t, args|
  cmd = "bundle exec gem install --local #{PROJECT}-#{lib_version}.gem"
  puts "[#{t.name}] installing gem locally"
  try(cmd, 'unable to install .gem')

  puts "[#{t.name}] task completed, gem installed locally"
end

desc [
  "pushes #{PROJECT}.gem to rubygems.org",
  " this requires an api key file at ~/.gem/credentials,",
  " and optionally a key name, if the credentials file has multiple keys",
  " (default name is 'rubygems', matching ':rubygems_api_key:' in file)",
  " see: https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg",
].join("\n")
task :gem_push, [:key_name] => ['gem'] do |t, args|
  args.with_defaults(:key_name => 'rubygems') # why a string different than the symbol found in file? ?! https://stackoverflow.com/a/36161249/3029276
  key_name = args[:key_name]

  credentials = File.join(Dir.home, '.gem', 'credentials')
  fail("cannot publish without api key file at #{credentials}\n  see: https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg") unless File.exists?(credentials)

  cmd = "bundle exec gem push #{PROJECT}-#{lib_version}.gem --key #{key_name}"
  puts "[#{t.name}] publishing gem..."
  try(cmd, 'unable to push .gem')

  puts "[#{t.name}] task completed"
end

desc [
  "updates the README screenshot via npm and puppeteer",
  " requires the site available at http://localhost:4000/",
  " relies on the puppeteer-core npm module and a compatible browser",
  " Puppeteer is on GitHub: https://github.com/GoogleChrome/puppeteer#puppeteer-core",
].join("\n")
task :screenshot do |t, args|
  unless path_to_exe('npm')
    puts "[#{t.name}] npm command not found, skipping auto-screenshot"
    puts "[#{t.name}]   please manually create an 850 x 800 px screenshot, and"
    puts "[#{t.name}]   save it in the root of this project dir as 'screenshot.png'"
  else
    np = 'NODE_PATH="$(npm root -g):$NODE_PATH"'
    bp = 'BROWSER_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"'
    dim = 'WIDTH=850 HEIGHT=800'
    cmd = "#{np} #{bp} #{dim} node ./build/screenshots/take_screenshot.js"
    puts "[#{t.name}] asking puppeteer to take a screenshot..."
    try(cmd, 'unable to take screenshot')
  end

  puts "[#{t.name}] task completed"
end

desc [
  "updates and rebuilds semantic ui files used by the theme",
  " expects a local path to a clone of the Semantic UI repo",
  " Semantic UI is on GitHub: https://github.com/Semantic-Org/Semantic-UI",
  "this task will copy the following files into the project to customize build output:",
  " semantic.json - limits the components built",
  " src/site/globals/site.variables - customizes global styles",
].join("\n")
task :semantic, [:sui_dir] do |t, args|
  args.with_defaults(:sui_dir => nil)
  sui_dir = args[:sui_dir]

  fail("cannot find semantic ui project at '#{sui_dir}'") unless (sui_dir && Dir.exists?(sui_dir))

  puts "[#{t.name}] copying custom build files to #{sui_dir}..."
  FileUtils.cp_r(File.join(semantic_build_dir, '.'), sui_dir)

  puts "[#{t.name}] running semantic build..."
  cmd = 'npm update --dev && gulp clean && gulp build'
  build_success = false
  Dir.chdir(sui_dir) do
    build_success = (system(cmd) == true)
  end
  fail('semantic build failed') unless build_success

  puts "[#{t.name}] copying generated files from semantic dist_dir..."
  components_dir = File.join(sui_dir, 'dist', 'components')
  scripts_dir = File.join(PROJECT_ROOT, '_includes', 'scripts', 'semantic-ui')
  styles_dir = File.join(PROJECT_ROOT, '_includes', 'styles', 'semantic-ui')

  puts "[#{t.name}]  updating #{relative_path(Pathname.pwd, scripts_dir)}"
  FileUtils.rm_rf(File.join(scripts_dir, '.'))
  FileUtils.cp(Dir.glob(File.join(components_dir, '*.min.js')), scripts_dir)

  puts "[#{t.name}]  updating #{relative_path(Pathname.pwd, styles_dir)}"
  FileUtils.rm_rf(File.join(styles_dir, '.'))
  FileUtils.cp(Dir.glob(File.join(components_dir, '*.min.css')), styles_dir)

  sui_p = JSON.parse(File.read(File.join(sui_dir, 'package.json')))
  sui_v = sui_p['version']
  puts "[#{t.name}] updating version in semantic license attributions to #{sui_v}..."
  File.open(File.join(scripts_dir, '_version.js'), 'w') { |f| f.write(semantic_attribution(sui_v)) }
  File.open(File.join(styles_dir, '_version.css'), 'w') { |f| f.write(semantic_attribution(sui_v)) }

  puts "[#{t.name}] task completed, semantic-ui files updated"
end

desc [
  "updates the docs config to use a local or remote theme",
  " provide an argument value of either 'local' or 'remote'",
  " 'local' is appropriate for development",
  " 'remote' is appropriate for releasing",
  " changes '#{relative_path(Pathname.pwd, project_config_file)}'",
].join("\n")
task :set_theme, [:which] do |t, args|
  args.with_defaults(:which => 'unspecified')
  set_theme(project_config_file, args.which)

  puts "[#{t.name}] task completed, theme is now #{args.which}"
end

task :theme_local do |t, args|
  which = 'local'
  set_theme(project_config_file, which)

  puts "[#{t.name}] task completed, theme is now #{which}"
end

task :theme_remote do |t, args|
  which = 'remote'
  set_theme(project_config_file, which)

  puts "[#{t.name}] task completed, theme is now #{which}"
end

desc [
  "reports library version",
].join("\n")
task :version do |t, args|
  puts "#{PROJECT} v#{lib_version}"
end

desc [
  "updates the theme version number",
  "changes the following files:",
  " '#{relative_path(Pathname.pwd, layout_version_file)}'",
  " '#{relative_path(Pathname.pwd, project_config_file)}'",
].join("\n")
task :set_version, [:v] do |t, args|
  args.with_defaults(:v => nil)
  fail('please provide a version string') unless (args.v && args.v.length > 0)

  lib_version = args.v
  update_lib_version(project_config_file, lib_version)

  version_hash = { 'theme_version' => args.v }
  update_front_matter(layout_version_file, version_hash)

  puts "[#{t.name}] task completed, lib version updated to #{lib_version}"
end

desc [
  "packages #{PROJECT} files for release as a zip archive",
  " the zip archive is created in a temp directory,",
  " and delivered to #{PROJECT_ROOT}",
].join("\n")
task :zip do |t, args|
  fail('zip archiving not yet supported on windows') if windows?

  release_dir = PROJECT_ROOT
  zip_name = "#{PROJECT}_v#{lib_version}.zip"
  zip_file = File.absolute_path(File.join(release_dir, zip_name))

  FileUtils.rm(zip_file) if (File.exists?(zip_file))

  Dir.mktmpdir do |tmp_dir|
    Dir.chdir(tmp_dir) do
      Dir.mkdir(PROJECT)
      cp_src(File.join(tmp_dir, PROJECT))
      zip_exclusions = exclusions.map { |e| "--exclude \"#{e}\"" }.join(' ')
      cmd = "zip --quiet --recurse-paths #{zip_file} #{PROJECT} #{zip_exclusions}"
      try(cmd, "unable to create #{zip_name}")
    end
  end

  puts "[#{t.name}] task completed, find #{zip_name} in #{relative_path(Pathname.pwd, release_dir)}/"
end

desc [
  "generate a new release candidate: updates screenshot, zip and gem packages",
  " requires docs to be live, locally (e.g. rake docs_regen in a separate process)",
  " runs clean first",
].join("\n")
task :release => ['clean', 'screenshot', 'theme_remote', 'zip', 'gem']
