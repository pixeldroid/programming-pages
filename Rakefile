require 'fileutils'
require 'pathname'


PROJECT = 'programming-pages'

PROJECT_ROOT = File.dirname(__FILE__)
TEMPLATE_DIR = File.join(PROJECT_ROOT, 'lib', 'src')
DOC_DIR = File.join(PROJECT_ROOT, 'lib', 'doc')
load File.join(File.join(PROJECT_ROOT, 'lib', 'tasks'), 'programming-pages.rake')

def lib_dir
  File.join(PROJECT_ROOT, 'lib')
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

def lib_version
  template_config['template_version']
end

def update_lib_version(new_value)
  # normally, a user would just update their project config,
  # and the template is versioned separately (by this project)
  #
  # but here the project _is_ the template,
  # and so both should be updated to the same version

  config = user_config
  config['project']['version'] = new_value
  write_yaml(user_config_file, config)

  config = template_config
  config['template_version'] = new_value
  write_yaml(template_config_file, config)
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
  "reports template version",
].join("\n")
task :version do |t, args|
  puts "#{PROJECT} v#{lib_version}"
end

namespace :lib do

  desc [
    "packages #{PROJECT} files for release as a zip archive",
  ].join("\n")
  task :package do |t, args|
    template_release = "#{PROJECT}_v#{lib_version}.zip"
    source_dir = File.absolute_path(src_dir)
    release_dir = PROJECT_ROOT
    released_template = File.absolute_path(File.join(release_dir, template_release))

    fail('zip archiving not yet supported on windows') if windows?

    FileUtils.rm(released_template) if (File.exists?(released_template))

    Dir.mktmpdir do |tmp_dir|
      Dir.chdir(tmp_dir) do
        Dir.mkdir(PROJECT)
        FileUtils.cp_r(File.join(source_dir, '.'), File.join(tmp_dir, PROJECT))
        zip_exclusions = exclusions.map { |e| "--exclude \"#{e}\"" }.join(' ')
        cmd = "zip --quiet --recurse-paths #{released_template} #{PROJECT} #{zip_exclusions}"
        try(cmd, "unable to create #{template_release}")
      end
    end

    puts "[#{t.name}] task completed, find #{template_release} in #{release_dir}/"
  end

  desc [
    "updates and rebuilds semantic ui files used by the template",
    " expects local path to a checkout of the Semantic UI repo",
    " Semantic UI is on GitHub: https://github.com/Semantic-Org/Semantic-UI",
    "this task will copy the following files into the project to customize build output:",
    " semantic.json - limits the components built",
    " src/site/globals/site.variables - customizes global styles",
  ].join("\n")
  task :semantic, [:dir] do |t, args|
    args.with_defaults(:dir => nil)
    fail("cannot find semantic ui project at '#{args.dir}'") unless (args.dir && Dir.exists?(args.dir))

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
    "sets the template version number into '#{Pathname(template_config_file).relative_path_from(Pathname.pwd).to_s}'",
  ].join("\n")
  task :version, [:v] do |t, args|
    args.with_defaults(:v => nil)
    fail('please provide a version string') unless (args.v && args.v.length > 0)

    lib_version = args.v
    update_lib_version(lib_version)

    puts "[#{t.name}] task completed, lib version updated to #{lib_version}"
  end

end
