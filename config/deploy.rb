require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/chruby'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, 'tetsuo'
set :deploy_to, '/home/akira/lament'
set :repository, 'git@github.com:indrode/lament.git'
set :branch, 'master'
set :chruby_path, "/usr/local/share/chruby/chruby.sh"

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['log']

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  invoke :'chruby[ruby-2.0.0-p247]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'

    to :launch do
      queue "touch #{deploy_to}/tmp/restart.txt"
    end
  end
end

# task :load_chruby => :environment do
#   # queue 'source /usr/local/share/chruby/chruby.sh'
#   queue 'source ~/.zshrc'
#   queue 'which chruby'
#   queue 'chruby ruby-2.0.0-p247'
#   queue 'ruby -v'
# end

# task :set_ruby do
#   queue 'source /usr/local/share/chruby/chruby.sh'
# end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

