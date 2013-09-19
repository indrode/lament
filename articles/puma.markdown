This is a quick guide for setting up Rack apps (e.g. Sinatra or Rails) for production use on a Linux server, using `nginx` and `puma`.

[NGINX](http://nginx.org/en/) (pronounced "engine X") is a HTTP and reverse proxy server. This guide assumes that `nginx` is set up and working using `init.d` scripts such as:

    /etc/init.d/nginx start

In short, `nginx` uses config files in `/etc/nginx/sites-enabled` which are symlinks to files located in `/etc/nginx/sites-available`. I tend to name these config files by the domain names, e.g. `some.domain.com`. It is a good idea to store a default configuration in `sites-available` that acts as a starting point when adding new sites to the nginx configuration.

Now on to [Puma](http://puma.io) a web server for Ruby. A configuration file for a Puma Rails app would look as follows. Note that we are creating an app for the user `bobharris` that is called `suntory`, and therefore located in directory `/home/bobharris/suntory`. As a Rails app, the root needs to point to `public`. For Sinatra, the actual root directory must be used.

    upstream suntory_app {
      server unix:///home/bobharris/suntory/tmp/puma/socket;
    }

    server {
      listen 80;
      server_name bob.suntory.com;
      keepalive_timeout 5;

    root /home/bobharris/suntory/public;
      access_log /var/log/suntory.access.log;
      error_log /var/log/suntory.error.log info;

      location / {
        try_files $uri @puma;
      }

      location @puma {
        include proxy_params;
        proxy_pass http://suntory_app;
      }
    }

The work flow would be something like the following:

    sudo nano /etc/nginx/sites-available/bob.suntory.com
    # paste the config from above
    cd /etc/nginx/sites-enabled
    ln -s /etc/nginx/sites-available/bob.suntory.com
    cd /home/bobharris/suntory

The Rails app should be set up in the correct location as mentioned above. I'm not going to go into detail on generating a Rails app. Ideally, the code is pulled from distributed version control management system, such as `git`. For Puma, the corresponding gem needs to be added to the `Gemfile`, followed by a `bundle`.

    gem 'puma'

The next step is to add a Puma config file in `config/puma.rb`. The following one should work just fine for small apps:

    root = "#{Dir.getwd}"
    daemonize true
    bind "unix://#{root}/tmp/puma/socket"
    pidfile "#{root}/tmp/puma/pid"
    state_path "#{root}/tmp/puma/state"
    rackup "#{root}/config.ru"

    threads 4, 8

    activate_control_app

That's almost all there is to do. Next up we can start Puma.

    bundle exe puma -C config/puma.rb

We also have to restart nginx to allow users to access the Rails app.

    /etc/init.d/nginx restart

That is all.