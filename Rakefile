require 'fileutils'
require 'rake/clean'


PROJECT = 'programming-pages'

# define these three constants before loading the programming-pages rake tasks
PROJECT_ROOT = File.dirname(__FILE__)
DOC_TEMPLATE_DIR = File.join(PROJECT_ROOT, 'build', 'doc-template')
DOC_SOURCE_DIR = File.join(PROJECT_ROOT, 'build', 'doc-source')
# load the rake tasks and include the module
load File.join(PROJECT_ROOT, '_tasks', 'programming-pages.rake')
require File.join(PROJECT_ROOT, '_tasks', 'progp')
include ProgP

[
  'docs',
  DOC_TEMPLATE_DIR,
].each { |f| CLEAN << f }
Rake::Task[:clean].clear_comments()
Rake::Task[:clean].add_description([
  "removes intermediate files to ensure a clean build",
  "running now would delete the following:\n  #{CLEAN.resolve.join("\n  ")}",
].join("\n"))

[
  '_site',
  'docs',
  DOC_TEMPLATE_DIR,
].each { |f| CLOBBER << f }
Rake::Task[:clobber].clear_comments()
Rake::Task[:clobber].add_description([
  "removes all generated artifacts to restore project to checkout-like state",
  "removes the following folders:\n  #{CLOBBER.join("\n  ")}",
].join("\n"))
Rake::Task[:clobber].enhance { FileUtils.rm_r(Dir.glob("#{PROJECT}_*.zip")) } # not sure why this glob pattern does not work in the clobber filelist


@template_source_config = nil

def src_dir
  PROJECT_ROOT
end

def build_dir
  File.join(PROJECT_ROOT, 'build')
end

def semantic_build_dir
  File.join(build_dir, 'semantic-build')
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

def template_source_config_file
  File.join(src_dir, '_config.yml')
end

def template_source_config
  @template_source_config || (@template_source_config = ProgP.read_yaml(template_source_config_file))
end

def template_source_files
  Dir[
    '_config.yml',
    '_data/**/*',
    '_includes/**/*',
    '_layouts/**/*',
    '_tasks/**/*',
    'assets/**/*',
    'favicon.png',
    base: src_dir
  ]
end

def lib_version
  template_source_config['template_version']
end

def update_lib_version(new_value)
  # normally, a user would just update their project config,
  # and the template is versioned separately (by this project)
  #
  # but here the project _is_ the template,
  # and so both should be updated to the same version

  config = user_config
  config['project']['version'] = new_value
  ProgP.write_yaml(user_config_file, config)

  config = template_source_config
  config['template_version'] = new_value
  ProgP.write_yaml(template_source_config_file, config)
end

def exclusions
  [
    '*.DS_Store',
  ]
end


task :default => [:list_targets]

task :list_targets do |t, args|
  a = "#{PROJECT} v#{lib_version} Rakefile"
  b = "running on Ruby #{RUBY_VERSION}"
  puts "#{a} #{b}"
  system('rake -T')
end

desc [
  "reports library version",
].join("\n")
task :version do |t, args|
  puts "#{PROJECT} v#{lib_version}"
end

def cp_src(dst_dir)
  template_source_files.each do |f|
    fa = File.absolute_path(File.join(src_dir, f))
    next unless File.file?(fa)

    fb = File.join(dst_dir, f)
    FileUtils.mkdir_p(File.dirname(fb))
    FileUtils.cp(fa, fb)
  end
end

namespace :lib do

  desc [
    "deploys the current local source files into DOC_TEMPLATE_DIR",
  ].join("\n")
  task :build do |t, args|
    puts "[#{t.name}] replacing contents of DOC_TEMPLATE_DIR with template source files"
    FileUtils.rm_rf(File.join(DOC_TEMPLATE_DIR, '.'))
    cp_src(DOC_TEMPLATE_DIR)

    puts "[#{t.name}] task completed, template updated at #{DOC_TEMPLATE_DIR}"
  end

  desc [
    "packages #{PROJECT} files for release as a ruby gem",
    "the gem is based on #{PROJECT}.gemspec,",
    "if :publish? is true, a push to rubygems.org will be attempted",
    " this requires an api key at ~/.gem/credentials",
    " see: https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg",
  ].join("\n")
  task :gem , [:publish?] do |t, args|
    args.with_defaults(:publish? => nil)
    publish = (args[:publish?] == 'true')
    if publish
      credentials = File.join(Dir.home, '.gem', 'credentials')
      ProgP.fail("cannot publish without api key at #{credentials}\n  see: https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg") unless File.exists?(credentials)
    end

    # TODO: extract to file task?
    cmd = "gem build #{PROJECT}.gemspec"
    ProgP.try(cmd, "unable to create gem")

    if publish
      puts "[#{t.name}] publishing gem to rubygems.org..."
      puts "[#{t.name}] j/k"
    else
      puts "[#{t.name}] publish step not requested, skipping."
    end

    puts "[#{t.name}] task completed, find gem in ./"
  end

  desc [
    "packages #{PROJECT} files for release as a zip archive",
    "the zip archive is created in a temp directory,",
    " and delivered to #{PROJECT_ROOT}",
  ].join("\n")
  task :package do |t, args|
    template_release = "#{PROJECT}_v#{lib_version}.zip"
    source_dir = File.absolute_path(src_dir)
    release_dir = PROJECT_ROOT
    released_template = File.absolute_path(File.join(release_dir, template_release))

    ProgP.fail('zip archiving not yet supported on windows') if windows?

    FileUtils.rm(released_template) if (File.exists?(released_template))

    Dir.mktmpdir do |tmp_dir|
      Dir.chdir(tmp_dir) do
        Dir.mkdir(PROJECT)
        cp_src(File.join(tmp_dir, PROJECT))
        zip_exclusions = exclusions.map { |e| "--exclude \"#{e}\"" }.join(' ')
        cmd = "zip --quiet --recurse-paths #{released_template} #{PROJECT} #{zip_exclusions}"
        ProgP.try(cmd, "unable to create #{template_release}")
      end
    end

    puts "[#{t.name}] task completed, find #{template_release} in #{release_dir}/"
  end

  desc [
    "updates and rebuilds semantic ui files used by the template",
    " expects a local path to a clone of the Semantic UI repo",
    " Semantic UI is on GitHub: https://github.com/Semantic-Org/Semantic-UI",
    "this task will copy the following files into the project to customize build output:",
    " semantic.json - limits the components built",
    " src/site/globals/site.variables - customizes global styles",
  ].join("\n")
  task :semantic, [:dir] do |t, args|
    args.with_defaults(:dir => nil)
    ProgP.fail("cannot find semantic ui project at '#{args.dir}'") unless (args.dir && Dir.exists?(args.dir))

    puts "[#{t.name}] copying custom build files to #{args.dir}..."
    FileUtils.cp_r(File.join(semantic_build_dir, '.'), args.dir)

    puts "[#{t.name}] running semantic build..."
    cmd = 'gulp clean && gulp build'
    build_success = false
    Dir.chdir(args.dir) do
      build_success = (system(cmd) == true)
    end
    ProgP.fail('semantic build failed') unless build_success

    puts "[#{t.name}] copying generated files from semantic dist_dir..."
    components_dir = File.join(args.dir, 'dist', 'components')
    scripts_dir = File.join(src_dir, '_includes', 'scripts', 'semantic-ui')
    styles_dir = File.join(src_dir, '_includes', 'styles', 'semantic-ui')

    puts "[#{t.name}]  updating #{scripts_dir}"
    FileUtils.rm_rf(File.join(scripts_dir, '.'))
    FileUtils.cp(Dir.glob(File.join(components_dir, '*.min.js')), scripts_dir)

    puts "[#{t.name}]  updating #{styles_dir}"
    FileUtils.rm_rf(File.join(styles_dir, '.'))
    FileUtils.cp(Dir.glob(File.join(components_dir, '*.min.css')), styles_dir)

    sui_p = JSON.parse(File.read(File.join(args.dir, 'package.json')))
    sui_v = sui_p['version']
    puts "[#{t.name}] updating version in semantic license attributions to #{sui_v}..."
    File.open(File.join(scripts_dir, '_version.js'), 'w') { |f| f.write(semantic_attribution(sui_v)) }
    File.open(File.join(styles_dir, '_version.css'), 'w') { |f| f.write(semantic_attribution(sui_v)) }

    puts "[#{t.name}] task completed, semantic-ui files updated"
  end

  desc [
    "sets the template version number into '#{from_pwd(template_source_config_file)}'",
  ].join("\n")
  task :version, [:v] do |t, args|
    args.with_defaults(:v => nil)
    ProgP.fail('please provide a version string') unless (args.v && args.v.length > 0)

    lib_version = args.v
    update_lib_version(lib_version)

    puts "[#{t.name}] task completed, lib version updated to #{lib_version}"
  end

end

desc [
  "shorthand for 'rake lib:build'",
].join("\n")
task :lib => ['lib:build']

desc [
  "generate a new release candidate, by updating the lib, docs, and package",
].join("\n")
task :release => ['lib:build', 'docs:build', 'lib:package']
