### development environment
rake development:start
rake development:status
rake development:stop

### start server on production
bundle exec puma -C config/puma.rb -e production
