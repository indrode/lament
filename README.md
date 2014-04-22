[![Code Climate](https://codeclimate.com/github/indrode/lament.png)](https://codeclimate.com/github/indrode/lament)

### development environment

    rake development:start
    rake development:status
    rake development:stop

### start server on production

    bundle exec puma -C config/puma.rb -e production
