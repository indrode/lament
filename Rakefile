require 'rubygems'
require 'rspec/core/rake_task'

DEV_ROOT = "~/projects/lament"

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

namespace :development do
  desc "Start development server and memcached"
  task :start do
    system("/usr/local/bin/memcached -d -P #{DEV_ROOT}/tmp/pids/memcached.pid")
    success = system("thin start -d -p3000 -P #{DEV_ROOT}/tmp/pids/thin.pid")
    puts "Success: #{success}"
  end

  desc "Stop development server and memcached"
  task :stop do
    system("thin stop -p #{DEV_ROOT}/tmp/pids/thin.pid")
    system("kill `cat #{DEV_ROOT}/tmp/pids/memcached.pid`")
    system("rm #{DEV_ROOT}/tmp/pids/memcached.pid")
  end

  desc "View development environment status"
  task :status do
    puts "Processes:"
    system("[ -f #{DEV_ROOT}/tmp/pids/thin.pid ] && echo 'thin is running'")
    system("[ -f #{DEV_ROOT}/tmp/pids/memcached.pid ] && echo 'memcached is running'")
    puts
  end
end

namespace :production do
  desc "Deploy to production"
  task :deploy do
    puts "Deploying..."
    success = system("rsync -zr --exclude '.*'  #{DEV_ROOT} tetsuo:~")
    puts "Success: #{success}"
  end

  desc "Restart Thin server on production"
  task :restart do
    puts "Restarting..."
    success = system('ssh anaconda "thin start -p 3004 --servers 2 &"')
    puts "Success: #{success}"
  end
end
