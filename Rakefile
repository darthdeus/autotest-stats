require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "autotest-stats"
    gem.summary = %Q{Collects and reports statistics about how you write tests}
    gem.description = %Q{An autotest plugin that monitors how you write tests, and reports}
    gem.email = "darthdeus@gmail.com"
    gem.homepage = "http://github.com/darthdeus/autotest-stats"
    gem.authors = ["Jakub Arnold"]
    gem.add_development_dependency "rspec", ">= 2.0.0"
    gem.add_development_dependency "ZenTest", ">= 4.1.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "autotest-stats #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
