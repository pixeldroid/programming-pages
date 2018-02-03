require 'fileutils'
require 'yaml'

@template_config = nil
@user_config = nil

TEMPLATE = 'programming-pages'
EXIT_OK = 0

def template_config_file
  File.join(lib_dir, '_config.yml')
end

def template_config
  @template_config || (@template_config = YAML.load(File.read(template_config_file)))
end

def user_config_file
  File.join(doc_dir, '_config.yml')
end

def user_config
  @user_config || (@user_config = YAML.load(File.read(user_config_file)))
end

def merged_config_file
  File.join(ghpages_dir, '_config.yml')
end

def merged_config
  template_config.merge(user_config)
end

def doc_dir
  File.join('.', 'lib', 'doc')
end

def lib_dir
  File.join('.', 'lib', 'src')
end

def ghpages_dir
  File.join('.', 'docs')
end

def lib_version
  template_config['template_version']
end

def exclusions
  [
    '*.DS_Store',
  ]
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
  "builds the documentation site for #{TEMPLATE}, under #{ghpages_dir}",
].join("\n")
task :build do |t, args|
  target_dir = ghpages_dir

  if (Dir.exists?(target_dir))
    puts "[#{t.name}] removing existing #{target_dir}..."
    FileUtils.rm_r(target_dir)
  end
  puts "[#{t.name}] creating and populating #{target_dir}..."

  FileUtils.cp_r(File.join(lib_dir, '/.'), target_dir)
  FileUtils.cp_r(File.join(doc_dir, '/.'), target_dir)
  File.open(merged_config_file, 'w') { |f| f.write(merged_config.to_yaml) }

  puts "[#{t.name}] task completed, find github pages ready site in #{target_dir}/"
end

desc [
  "packages #{TEMPLATE} for release",
].join("\n")
task :package do |t, args|
  template_release = "#{TEMPLATE}_v#{lib_version}.zip"
  source_dir = lib_dir
  release_dir = '.'
  released_template = File.join(release_dir, template_release)

  fail('zip archiving not yet supported on windows') if windows?
  zip_exclusions = exclusions.map { |e| "--exclude \"#{e}\"" }.join(' ')
  cmd = "zip --quiet --recurse-paths #{released_template} #{source_dir} #{zip_exclusions}"

  FileUtils.rm(released_template) if (File.exists?(released_template))
  try(cmd, "unable to create #{template_release}")

  puts "[#{t.name}] task completed, find #{template_release} in #{release_dir}/"
end
