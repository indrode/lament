_Sometimes, you don't want to host you git repositories on services like [GitHub](http://www.github.com/) or [Bitbucket](https://bitbucket.org)._ So why not host them yourself?

This guide assumes that you have set up a remove Ubuntu/Debian server somewhere that has the name `monkey` and added a sudo-user on this server, called `chimpmaster`. Also, on your local development machine (and on the production servers, but we'll ignore that for now) you have a pair of private/public keys to be used for your git server authentication.

Check out the [Key Authentication over SSH](/authentication) article to learn more about setting up key authentication.

## Add the git user

Log into `monkey` as `chimpmaster`. First, make sure that `git` is actually installed.

    sudo apt-get install git
    which git-shell

The latter command checks the location of the `git-shell` tool which was installed along git and which we will restrict our git-user to. This user does not exist yet, so let's add him and call him `git`.

    adduser git

As mentioned, you don't want to allow this user to do anything but git-related things on our server, so we do not allow regular shell access for him.

    sudo vim /etc/passwd

This is the passwords file. The last line should be the git user's entry and look something like this: `git:x:1001:1001:,,,:/home/git:/bin/sh`. Replace the part after the `git:` with the result of `which git-shell`, i.e.

    git:x:1001:1001:,,,:/home/git:/usr/bin/git-shell

Our git user is now restricted to use `git-shell`.

## Add key authentication

Since the git user can't access the shell anymore, we will do all required setups as `chimpmaster` and chown the changes back to the user `git`. What we do here is to add our public key to `/home/git/.ssh/authorized_keys`.

Again, check out [Key Authentication over SSH](/authentication), but don't forget to `chown -R git:git /home/git/.ssh` when you're done. Now, from your local development box, you should be able to do the following:

    ssh git@monkey

You won't actually be able to get very far and see something like the following (which is just what we wanted):

    fatal: Interactive git shell is not enabled.

## Set up a git repo

Okay, back on `monkey` and logged in as `chimpmaster`, you can now set up a git repository that our local machine can push to. The `--bare` option sets up the repository without a working folder.

    cd /home/git
    mkdir super-repo.git
    cd super-repo.git
    git --bare init
    sudo chown -R git:git /home/git/super-repo.git

Back on the development box, create the `super-repo` and push it to our newly created git server!

    mkdir super-repo
    cd super-repo
    git init
    touch readme.txt
    git commit -am "It lives!"
    git remote add origin git@monkey:/home/git/super-repo.git
    git push -u origin master

That is all.
