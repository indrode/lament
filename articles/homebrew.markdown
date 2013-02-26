_Homebrew is a package manager for Mac OS and you should really use it._ It is the easiest way to install and maintain packages that you want to install on your system. You can chose from an [exhaustive list of packages](https://github.com/mxcl/homebrew/tree/master/Library/Formula/) and Homebrew does a pretty good job of keeping all these packages up to date.

Homebrew installs packages (called `Formula`) into their own folders, then symlinks them to `/usr/local`. Homebrew itself is a `git` repository (again, located in `/usr/local`), so you can modify it, add `https://github.com/mxcl/homebrew.git` as an upstream, then merge the changes. _Formulae are simple [Ruby scripts](https://github.com/mxcl/homebrew/blob/master/Library/Formula/ninja.rb)_. I can also relate to the beer terminology.

    # install Homebrew
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    
The workflow is simple. Here is a quick cheat sheet.

    # install new formula, e.g. mysql
    brew install mysql
    
    # pull new formula definitions
    brew update
    
    # update single formula
    brew upgrade mysql
    
    # edit a formula
    brew edit mysql
    
    # remove from /usr/local without de-installing
    brew unlink mysql
  
That is all.