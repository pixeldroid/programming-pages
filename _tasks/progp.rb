# encoding: utf-8

require 'pathname'

module ProgP

  RELEASE_API = 'https://api.github.com/repos/pixeldroid/programming-pages/releases/latest'
  EXIT_OK = 0

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

  def const_find(name)
    Module.const_defined?(name) ? Module.const_get(name) : nil
  end

  def from_pwd(path)
    Pathname(path).relative_path_from(Pathname.pwd).to_s
  end

  def read_yaml(file)
    File.file?(file) ? YAML.load(File.read(file)) : {}
  end

  def write_yaml(file, config)
    IO.write(file, config.to_yaml)
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

end
