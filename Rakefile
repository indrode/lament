require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern = 'spec/**/*_spec.rb'
end

task :default do
 puts "Lamenting Robot v0.1"
 puts "--------------------------------------------"
 puts "Run 'thin start' to start server."
 puts "Run 'rspec' or 'rake spec' to run tests."
end