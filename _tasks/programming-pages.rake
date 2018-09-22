require 'fileutils'
require 'json'
require 'net/http'
require 'open-uri'
require 'pathname'
require 'tmpdir'
require 'uri'
require 'yaml'

require File.join(File.dirname(__FILE__), 'progp')
include ProgP

begin
  check = [
    PROJECT_ROOT,
    DOC_TEMPLATE_DIR,
    DOC_SOURCE_DIR,
  ]
rescue NameError
  abort([
    'error: unspecified constant(s)',
    '  please ensure PROJECT_ROOT, DOC_TEMPLATE_DIR, and DOC_SOURCE_DIR are defined before loading this rakefile',
  ].join("\n"))
end


@template_config = nil
@user_config = nil
@template_fonts = nil
@user_fonts = nil

def template_config_file
  File.join(DOC_TEMPLATE_DIR, '_config.yml')
end

def template_config
  @template_config || (@template_config = ProgP.read_yaml(template_config_file))
end

def template_version
  template_config['template_version']
end

def user_config_file
  File.join(DOC_SOURCE_DIR, '_config.yml')
end

def user_config
  @user_config || (@user_config = ProgP.read_yaml(user_config_file))
end

def merged_config_file
  File.join(ghpages_dir, '_config.yml')
end

def merged_config
  template_config.merge(user_config)
end

def template_font_file
  File.join(DOC_TEMPLATE_DIR, '_data', 'svg_icons.yml')
end

def template_fonts
  @template_fonts || (@template_fonts = ProgP.read_yaml(template_font_file))
end

def template_download_url
  uri = URI(ProgP::RELEASE_API)

  begin
    response = Net::HTTP.get_response(uri)
    ProgP.fail("#{response.code} - failed to access GitHub API at '#{ProgP::RELEASE_API}'") unless (response.code == '200')
  rescue SocketError
    ProgP.fail("failed to connect; is there network access?")
  end

  result = JSON.parse(response.body)
  result['assets'].first['browser_download_url']
end

def user_font_file
  File.join(DOC_SOURCE_DIR, '_data', 'svg_icons.yml')
end

def user_fonts
  @user_fonts || (@user_fonts = ProgP.read_yaml(user_font_file))
end

def merged_font_file
  File.join(ghpages_dir, '_data', 'svg_icons.yml')
end

def merged_fonts
  template_fonts.merge(user_fonts)
end

def ghpages_dir
  File.join(PROJECT_ROOT, 'docs')
end

def site_dir
  File.join(PROJECT_ROOT, '_site')
end

def jekyll_cmd
  "bundle exec jekyll serve -I -s #{ProgP.from_pwd(ghpages_dir)} -d #{ProgP.from_pwd(site_dir)}"
end


namespace :template do

  desc [
    "downloads the latest release from GitHub, installing to DOC_TEMPLATE_DIR",
  ].join("\n")
  task :update do |t, args|
    puts "[#{t.name}] asking GitHub for latest release.."
    asset_url = template_download_url
    puts "[#{t.name}] found asset at '#{asset_url}'"

    FileUtils.remove_dir(DOC_TEMPLATE_DIR) if (Dir.exists?(DOC_TEMPLATE_DIR))

    Dir.mktmpdir do |tmp_dir|
      Dir.chdir(tmp_dir) do
        puts "[#{t.name}] starting download.."
        uri = URI(asset_url)
        filepath = File.join('.', File.basename(asset_url))
        IO.write(filepath, uri.open().read())
        puts "[#{t.name}] download complete"

        puts "[#{t.name}] unzipping template.."
        cmd = "unzip -q #{filepath}"
        ProgP.try(cmd, "unzip failed")

        puts "[#{t.name}] copying template files to DOC_TEMPLATE_DIR"
        FileUtils.cp_r(Dir.glob('*/').first, DOC_TEMPLATE_DIR)
      end
    end

    puts "[#{t.name}] task completed, template updated at #{DOC_TEMPLATE_DIR}"
  end

  desc [
    "reports installed and available versions of programming pages template",
    "latest available version is retrieved from github (requires internet connection)",
  ].join("\n")
  task :version do |t, args|
    zipfile = File.basename(template_download_url, '.zip')
    latest_version = zipfile.split('_v').last
    puts "v#{template_version} (latest available: v#{latest_version})"
  end

end

namespace :docs do

  desc [
    "builds the GitHub pages documentation site, under '#{ProgP.from_pwd(ghpages_dir)}/'",
    "  first, any existing documentation site files are removed",
    "  then, files from DOC_TEMPLATE_DIR are copied in",
    "  and, user files from DOC_SOURCE_DIR are copied over top",
    "  and, user defined fonts from DOC_SOURCE_DIR/_data/svg_icons.yml are merged onto the template fonts",
    "  and, jekyll site config from DOC_SOURCE_DIR/_config.yml is merged onto the template config",
    "if jekyll is installed, you can preview the doc site locally:",
    "  $ #{jekyll_cmd}",
  ].join("\n")
  task :build => ['docs:clean_docs_dir'] do |t, args|
    ProgP.fail('please ensure the template is installed before running this task') unless Dir.exists?(DOC_TEMPLATE_DIR)

    puts "[#{t.name}] adding template files from #{DOC_TEMPLATE_DIR}..."
    FileUtils.cp_r(File.join(DOC_TEMPLATE_DIR, '.'), ghpages_dir)
    FileUtils.rm_r(File.join(ghpages_dir, '_tasks'))

    puts "[#{t.name}] adding user files from #{DOC_SOURCE_DIR}..."
    FileUtils.cp_r(File.join(DOC_SOURCE_DIR, '.'), ghpages_dir)
    ProgP.write_yaml(merged_font_file, merged_fonts)
    ProgP.write_yaml(merged_config_file, merged_config)

    puts "[#{t.name}] task completed, find github pages ready site in #{ghpages_dir}/"
    puts "[#{t.name}] preview locally: #{jekyll_cmd}" if (ProgP.path_to_exe('jekyll'))
  end

  task :clean_docs_dir do |t, args|
    if (Dir.exists?(ghpages_dir))
      puts "[#{t.name}] emptying #{ghpages_dir} to start clean..."
      FileUtils.rm_r(Dir.glob(File.join(ghpages_dir, '*')))
    end
  end

end

desc [
  "shorthand for 'rake docs:build'",
].join("\n")
task :docs => ['docs:build']
