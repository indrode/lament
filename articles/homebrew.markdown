This is the first of a series of basic cheat sheets, a.k.a. stuff written down here so you don't have to google it in case you forget.

_Homebrew is a package manager for Mac OS and you should really use it._ It is the easiest way to install and maintain packages that you want to install on your system. You can choose from an [exhaustive list of packages](https://github.com/mxcl/homebrew/tree/master/Library/Formula/) and Homebrew does a pretty good job of keeping all these packages up to date.

Homebrew installs packages (called `Formula`) into their own folders, then symlinks them to `/usr/local`. Homebrew itself is a `git` repository (again, located in `/usr/local`), so you can modify it, add `https://github.com/mxcl/homebrew.git` as an upstream, then merge the changes. _Formulae are simple [Ruby scripts](https://github.com/mxcl/homebrew/blob/master/Library/Formula/ninja.rb)_. I can also relate to the beer terminology.

The cheat sheet has been temporarily removed.

That is all.