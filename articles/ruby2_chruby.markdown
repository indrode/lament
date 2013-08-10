There are a few Ruby version switchers going around in the Ruby world, most notoriously **RVM** and **rbenv**, both of which have done a perfectly fine job for most people. Both have their advantages and disadvantages. _In my [previous article](/pow_and_chruby), I mentioned that **chruby** rocks, and now I tell you why._

[Postmodern's chruby](https://github.com/postmodern/chruby) is incredibly small (about 80 LOC) and does everything it needs to do, but nothing more. After setting it up and installing your desired Ruby versions, you will have them all neatly sitting in the `/opt/rubies` folder. Gems are placed in `~/.gem` (unless you are `root`, which is just a bad idea).

Other people have already written blog posts [here](http://sloblog.io/~tja/ZUW75SmckIE/chruby-ruby-build-rvm) and [there](http://blog.steveklabnik.com/posts/2012-12-13-getting-started-with-chruby) reasoning their switch from tools like `rvm`. For me personally, what it comes down to is the simplicity. I know where my Rubies are. I know where my gems are. I can quickly designate a specific Ruby version to a project using a `.ruby-version` file in the application's root folder. No need for [shims](https://github.com/sstephenson/rbenv/#understanding-shims), no tweaking `cd` commands, no absolute mess when removing Ruby versions.

## Set up chruby

Refer to the [GitHub page](https://github.com/postmodern/chruby) for everything you need to know about setting up this little tool. The easiest way to do this is by using **Homebrew** (did I mention that Homebrew rocks? I might have to dedicate it a future article too).

    brew install chruby
    brew install openssl readline libyaml gdbm libffi

This also installs some other required packages, such as `openssl`. The only change to be made to your `.bashrc` or `.zshrc` file:

    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
    chruby ruby-1.9.3

The second line is not even necessary, but it triggers auto-switching when changing directories. As mentioned above, you can then add your desired Ruby version (e.g. `ruby-1.9.3`) to your application's `.ruby-version`.

The third line sets a default Ruby version. This is also optional, but generally a good thing to do.

## Install Ruby 2.0

_Today marks the first day of availability for [Ruby's stable 2.0.0 version](http://www.ruby-lang.org/en/news/2013/02/24/ruby-2-0-0-p0-is-released/)._ With chruby set up, there are two ways to update to Ruby 2.0: built from source or install it using [ruby-build](https://github.com/sstephenson/ruby-build).

This would be the way to do it manually:

    wget http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
    tar -xzvf ruby-2.0.0-p0.tar.gz
    cd ruby-2.0.0-p0
    ./configure --prefix=/opt/rubies/ruby-2.0.0-p0 --with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline` --with-yaml-dir=`brew --prefix libyaml` --with-gdbm-dir=`brew --prefix gdbm` --with-libffi-dir=`brew --prefix libffi`
    make
    sudo make install

Note that this lengthy `/.configure` command is required to point the installation to the correct brew-installed paths. At least that's what I needed to do on my Mountain Lion installation. You can safely ignore any warnings of type `unrecognized options: --with-openssl-dir`.

_The much simpler way to update your Ruby is to use **ruby-build**:_

    brew update
    brew install ruby-build
    ruby-build 2.0.0-p0 /opt/rubies/ruby-2.0.0-p0

Once all these steps have succesfully run, you can do a `chruby 2.0` in your shell to switch to this version.

    % ruby -v
    ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.0]

For my Ruby projects, I now had to re-install the `bundler` gem, followed by upating the project's gems. Note, that at the time of the Ruby 2.0.0 launch it was necessary to install the `pre`-version of Bundler.

    gem install bundler --pre
    bundle

_NOTE: Ruby 2.0.0-p0 is causing [segmentation faults](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/52930) in various setups. Maybe you should listen to Yehuda Katz's advice..._

<blockquote class="twitter-tweet"><p>It looks like there are some issues with OpenSSL certs and Ruby 2.0. If I were you, I’d wait a few days for things to get sorted.</p>&mdash; Yehuda Katz (@wycats) <a href="https://twitter.com/wycats/status/305817088012996609">February 24, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

That is all.





