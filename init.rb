require 'thor'

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
    say "Trying to run android update project"
    begin
      `android update project -p .`
      say "done."
    rescue Exception=>e
    end
  end
end
