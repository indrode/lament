require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern = 'spec/**/*_spec.rb'
  task.verbose = false
end

task :default do
  puts "Lamenting Robot v0.1"
  puts "-------------------------------------------------------"
  puts "Run 'thin start' to start server."
  puts "Run 'rspec' or 'rake spec' to run tests."
  puts "Run 'rake production:deploy' to deploy to production."
  puts "Run 'rake production:restart' to restart Thin."
end

namespace :production do
  desc "Deploy to production"
  task :deploy do
    puts "Deploying..."
    success = system("rsync -zr --exclude '.*'  ~/projects/lament tetsuo:~")
    puts "Success: #{success}"
  end

  desc "Restart Thin server on production"
  task :restart do
    puts "Restarting..."
    success = system('ssh anaconda "thin start -p 3004 --servers 2 &"')
    puts "Success: #{success}"
  end
end
