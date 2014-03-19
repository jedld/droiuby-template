require 'rubygems'
require 'net/http'
require 'net/http/post/multipart'
require 'zip'
require 'thor'
require "uri"
require 'cgi'
require 'active_support/core_ext/object'
require 'active_support/core_ext/string'

class Init < Thor

  include Thor::Actions

  source_root File.join(File.dirname(__FILE__), 'templates')

  desc "init [java package] [archive]", "initialize this template project"
  def init(package, archive)
    package_folders = package.split('.')
    dest_folder = 'src'
    @package_name = package
    @archive_name = archive
    template File.join('AndroidManifest.xml.erb'), "AndroidManifest.xml"
    template File.join('StartupActivity.java.erb'), File.join(dest_folder, *package_folders, "StartupActivity.java")
    template File.join('DroiubyActivity.java.erb'), File.join(dest_folder, *package_folders, "DroiubyActivity.java")
  end
end
