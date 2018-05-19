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

@template_config = nil
@user_config = nil

def template_config_file
  File.join(DOC_TEMPLATE_DIR, '_config.yml')
end

def template_config
  @template_config || (@template_config = ProgP.read_yaml(template_config_file))
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

def ghpages_dir
  File.join(PROJECT_ROOT, 'docs')
end

def site_dir
  File.join(PROJECT_ROOT, '_site')
end

def jekyll_cmd
  "bundle exec jekyll serve -I -s #{ProgP.from_pwd(ghpages_dir)} -d #{ProgP.from_pwd(site_dir)}"
end


task :check_consts do |t, args|
  ProgP.fail('please define the PROJECT_ROOT constant before loading this rakefile') unless ProgP.const_find('PROJECT_ROOT')
  ProgP.fail('please define the DOC_TEMPLATE_DIR constant before loading this rakefile') unless ProgP.const_find('DOC_TEMPLATE_DIR')
  ProgP.fail('please define the DOC_SOURCE_DIR constant before loading this rakefile') unless ProgP.const_find('DOC_SOURCE_DIR')
end

namespace :template do

  task :get_latest do |t, args|
    puts "[#{t.name}] asking GitHub for latest release.."

    uri = URI(ProgP::RELEASE_API)

    begin
      response = Net::HTTP.get_response(uri)
      ProgP.fail("#{response.code} - failed to access GitHub API at '#{ProgP::RELEASE_API}'") unless (response.code == '200')
    rescue SocketError
      ProgP.fail("failed to connect; is there network access?")
    end

    result = JSON.parse(response.body)
    asset_url = result['assets'].first['browser_download_url']
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
    "downloads the latest release from GitHub, installing to DOC_TEMPLATE_DIR",
  ].join("\n")
  task :update => [:check_consts, 'template:get_latest']

end

namespace :docs do

  # TODO: make template:update a pre-req / maybe make a file task?
  desc [
    "builds the GitHub pages documentation site, under '#{ProgP.from_pwd(ghpages_dir)}/'",
    " first, any existing documentation site files are removed",
    " then, files from DOC_TEMPLATE_DIR are copied in",
    " then, files from DOC_SOURCE_DIR are copied over top",
    " lastly, jekyll site config from DOC_SOURCE_DIR is merged over top of the template config",
    "if jekyll is installed, you can preview the doc site locally:",
    "  $ #{jekyll_cmd}",
  ].join("\n")
  task :build => [:check_consts] do |t, args|
    target_dir = ghpages_dir

    ProgP.fail('please ensure the template is installed before running this task') unless Dir.exists?(DOC_TEMPLATE_DIR)

    if (Dir.exists?(target_dir))
      puts "[#{t.name}] removing existing #{target_dir}..."
      FileUtils.rm_r(target_dir)
    end
    puts "[#{t.name}] creating and populating #{target_dir}..."

    FileUtils.cp_r(File.join(DOC_TEMPLATE_DIR, '.'), target_dir)
    FileUtils.rm_r(File.join(target_dir, '_tasks'))
    FileUtils.cp_r(File.join(DOC_SOURCE_DIR, '.'), target_dir)
    ProgP.write_yaml(merged_config_file, merged_config)

    puts "[#{t.name}] task completed, find github pages ready site in #{target_dir}/"
    puts "[#{t.name}] preview locally: #{jekyll_cmd}" if (ProgP.path_to_exe('jekyll'))
  end

end

desc [
  "shorthand for 'rake docs:build'",
].join("\n")
task :docs => ['docs:build']
