require 'thor'

class Init < Thor

  include Thor::Actions

  source_root File.join(File.dirname(__FILE__), 'templates')

  desc "init [java package] [archive] [name]", "initialize this template project"
  method_option :hybrid, :type => :boolean, :default=>false

  def init(package, archive, name = 'HelloWorld')
    package_folders = package.split('.')
    dest_folder = 'src'
    @package_name = package
    @archive_name = archive
    @project_name = name
    template File.join('AndroidManifest.xml.erb'), "AndroidManifest.xml"
    template File.join('strings.xml.erb'), File.join('res','values','strings.xml')
    if (options[:hybrid])
      template File.join('index.xml.erb'), File.join('res','layout','index.xml')
    end
    template File.join('StartupActivity.java.erb'), File.join(dest_folder, *package_folders, "StartupActivity.java")
    template File.join('DroiubyActivity.java.erb'), File.join(dest_folder, *package_folders, "DroiubyActivity.java")
    say "Trying to run android update project"
    begin
      `android update project -p .`
      say "done."
    rescue Exception=>e
    end
  end
end
