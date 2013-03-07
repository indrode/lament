## What?

_[Pow](http://pow.cx) is a zero-configuration Rack server for Mac OS X. It is perfect for quickly serving Rack applications during development._ I use it for basically all my Rack apps (those that have a `config.ru` rackup file).

Pow's developer, [37signal](https://37signals.com), claims that it takes less than a minute to set up a new app to be served in your local development environment. Here's how it goes if you're using [chruby](https://github.com/postmodern/chruby) instead of **RVM** or **rbenv** as your Rubies-manager. I may write a future post about why I think **chruby** rocks.

    curl get.pow.cx | sh
    cd ~/.pow
    ln -s /path/to/myapp
  
The commands above are taken straight from the Pow homepage. To make all this work with `chruby`, add a `.powrc` file to your applications root folder. This folder holds the `chruby` commands to set your the appropriate Ruby version.

    source /usr/local/opt/chruby/share/chruby/chruby.sh
    chruby ruby-1.9.3

Now, you can access your app in your browser at `http://myapp.dev`. One more thing you might want to do is to reload the application before every request, since you're using Pow as a development server anyway. To do this, just add a `always_restart.txt` to your app's `tmp` folder.

    touch tmp/always_restart.txt
  
Lastly, the Pow log files are located in `~/Library/Logs/Pow`. You'll find a general `access.log` and (for our example) an app-specific `apps/myapp.log` to grep and tail to your convenience.

That is all.