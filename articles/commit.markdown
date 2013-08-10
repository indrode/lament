The syntax I have used to write my git commit messages has changed several times during the past years, but I have come to terms with myself and now basically agree with everything that the [Erlang/OTP maintainers](https://github.com/erlang/otp/wiki/Writing-good-commit-messages) or [Scott Chacon/Pro Git](http://git-scm.com/book/ch5-2.html) have to say about this subject.

_Commit messages, similarily to coding style, should be consistent._ All in all, end up with something like this:

    Summarize clearly in one line what the commit is about

    Describe the problem the commit solves or the use
    case for a new feature. Justify why you chose
    the particular solution.

In particular, follow these rules: Write the summary line of what you have done in the imperative mode, that is as if you were commanding someone. Write "Fix", "Add", "Change" instead of "fixed", "added", "changed". Don’t end the summary line with a period and keep it below 50 characters in length. Also, get rid of these asterisks or other fancy character when starting your summary line. Emoji are tempting, but please don't go overboard. Adding one here or there, about once every 50 commits feels more than adequate.

The second line is blank and the detailed summary part is optional. You may use asterisks as bullet points here and should end sentences with a period. The detailed summary may just include the Pivotal story id, e.g. `[#342260]`. Other than that, it follows the same rules as above, except that git wraps it at column 72, so keep that in mind when composing it. I like to use a nifty little feature in `vim` that visually informs me, when I have exceeded the desired line length of my commit messages.

First, install and set up `vim` as the git's default editor if you haven't done so.

    brew install vim
    # in ~/.gitconfig, add 'editor = vim' in the [core] section

Now add the following to `.vimrc`.

    syntax on
    filetype indent plugin on

Now, when composing a commit message using `git commit` you can notice that the color of the text changes when you exceed the line length.

That is all.