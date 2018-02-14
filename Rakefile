require 'fileutils'
require 'json'
require 'tmpdir'
require 'yaml'

@template_config = nil
@user_config = nil

TEMPLATE = 'programming-pages'
JEKYLL_CMD = 'bundle exec jekyll serve -I -s docs'

EXIT_OK = 0

def lib_dir
  File.join('.', 'lib')
end

def ghpages_dir
  File.join('.', 'docs')
end

def doc_dir
  File.join(lib_dir, 'doc')
end

def src_dir
  File.join(lib_dir, 'src')
end

def semantic_build_dir
  File.join(lib_dir, 'semantic-build')
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

def template_config_file
  File.join(src_dir, '_config.yml')
end

def template_config
  @template_config || (@template_config = read_yaml(template_config_file))
end

def user_config_file
  File.join(doc_dir, '_config.yml')
end

def user_config
  @user_config || (@user_config = read_yaml(user_config_file))
end

def merged_config_file
  File.join(ghpages_dir, '_config.yml')
end

def merged_config
  template_config.merge(user_config)
end

def lib_version
  template_config['template_version']
end

def update_lib_version(new_value)
  config = template_config
  config['template_version'] = new_value
  write_yaml(template_config_file, config)
end

def exclusions
  [
    '*.DS_Store',
  ]
end


def read_yaml(file)
  YAML.load(File.read(file))
end

def write_yaml(file, config)
  IO.write(file, config.to_yaml)
end

def exec_with_echo(cmd)
  puts(cmd)
  stdout = %x[#{cmd}]
  puts(stdout) unless stdout.empty?
  $?.exitstatus
end

def fail(message)
  abort("✘ #{message}")
end

def try(cmd, failure_message)
  fail(failure_message) if (exec_with_echo(cmd) != EXIT_OK)
end

def which(cmd)
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


# TODO: version set and retrieve

task :default => [:list_targets]

task :list_targets do |t, args|
  a = "#{TEMPLATE} v#{lib_version} Rakefile"
  b = "running on Ruby #{RUBY_VERSION}"
  puts "#{a} #{b}"
  system('rake -T')
end

desc [
  "reports template version",
].join("\n")
task :version do |t, args|
  puts "#{TEMPLATE} v#{lib_version}"
end

namespace :docs do

  desc [
    "builds the GitHub pages compatible doc site for #{TEMPLATE}, under #{ghpages_dir}",
    "if jekyll is installed, you can preview the doc site locally:",
    "  $ #{JEKYLL_CMD}",
  ].join("\n")
  task :build do |t, args|
    target_dir = ghpages_dir

    if (Dir.exists?(target_dir))
      puts "[#{t.name}] removing existing #{target_dir}..."
      FileUtils.rm_r(target_dir)
    end
    puts "[#{t.name}] creating and populating #{target_dir}..."

    FileUtils.cp_r(File.join(src_dir, '/.'), target_dir)
    FileUtils.cp_r(File.join(doc_dir, '/.'), target_dir)
    File.open(merged_config_file, 'w') { |f| f.write(merged_config.to_yaml) }

    puts "[#{t.name}] task completed, find github pages ready site in #{target_dir}/"
    puts "[#{t.name}] preview locally: #{JEKYLL_CMD}" if (which('jekyll'))
  end

end

namespace :lib do

  desc [
    "packages #{TEMPLATE} files for release as a zip archive",
  ].join("\n")
  task :package do |t, args|
    template_release = "#{TEMPLATE}_v#{lib_version}.zip"
    source_dir = File.absolute_path(src_dir)
    release_dir = '.'
    released_template = File.absolute_path(File.join(release_dir, template_release))

    fail('zip archiving not yet supported on windows') if windows?

    FileUtils.rm(released_template) if (File.exists?(released_template))

    Dir.mktmpdir do |tmp_dir|
      Dir.chdir(tmp_dir) do
        Dir.mkdir(TEMPLATE)
        FileUtils.cp_r(File.join(source_dir, '.'), File.join(tmp_dir, TEMPLATE))
        zip_exclusions = exclusions.map { |e| "--exclude \"#{e}\"" }.join(' ')
        cmd = "zip --quiet --recurse-paths #{released_template} #{TEMPLATE} #{zip_exclusions}"
        try(cmd, "unable to create #{template_release}")
      end
    end

    puts "[#{t.name}] task completed, find #{template_release} in #{release_dir}/"
  end

  desc [
    "updates semantic ui files used by the template",
    " expects local path to a checkout of the Semantic UI repo",
    " Semantic UI is on GitHub: https://github.com/Semantic-Org/Semantic-UI",
    "this task will copy the following files into the project to customize build output:",
    " semantic.json - limits the components built",
    " src/site/globals/site.variables - customizes global styles",
  ].join("\n")
  task :semantic, [:dir] do |t, args|
    args.with_defaults(:dir => nil)
    fail("cannot find semantic ui project at #{args.dir}") unless Dir.exists?(args.dir)

    puts "[#{t.name}] copying custom build files to #{args.dir}..."
    FileUtils.cp_r(File.join(semantic_build_dir, '.'), args.dir)

    puts "[#{t.name}] running semantic build..."
    cmd = 'gulp clean && gulp build'
    build_success = false
    Dir.chdir(args.dir) do
      build_success = (system(cmd) == true)
    end
    fail('semantic build failed') unless build_success

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
    "sets the template version number into #{template_config_file}",
  ].join("\n")
  task :version, [:v] do |t, args|
    args.with_defaults(:v => '0.0.0')
    lib_version = args.v

    update_lib_version(lib_version)

    puts "[#{t.name}] task completed, lib version updated to #{lib_version}"
  end

end
