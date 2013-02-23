_Hubot is a GitHub product that adds automation to one or more group chat rooms._ It's written in CoffeeScript and Node.js and ships with a small set of core scripts that can be run from within a chat, such as searching for images, sending tweets, and more. If you want the full effect, you can add more scripts that have been open-sourced, or write your own ones. For example, Hubot could give you status updates, CI-build information, deploy apps, etc. The possibilities are endless. Read all about it on Hubot's own official page: [http://hubot.github.com](http://hubot.github.com).

This quick step-by-step guide sets up a Hubot to be used in a Talker chat room ([http://talkerapp.com](http://talkerapp.com)), so the first thing to do is to sign up for a Talker account and set up a chat room there. It's free. This also assumes that you have a GitHub account and a verified Heroku account, since we are going to deploying our Hubot instance to this service.

**1. Create and clone a new GitHub repo**

This takes about 10 seconds if you have done it before. If not, check out this [guide on github.com](https://help.github.com/articles/create-a-repo) on how to create a new repository.

**2. Download Hubot from [http://hubot.github.com](http://hubot.github.com) and add it to your repo**

Now, the first thing to do is make a few changes to `package.json`. First, we update the actual Hubot version used as a dependency. Next, we specify the Node.js and `npm` versions. Finally, we add add a `hubot-talker` dependency. In the end, `package.json` should like something like [this gist right here](https://gist.github.com/indrode/5014705).

Check the [Heroku developer guides](https://devcenter.heroku.com/articles/nodejs-versions) for information on current `node` and `npm` versions. Of course, you could also use wildcards.

**3. Make, commit, and push your repo changes**

After you've made the changes above, it would be a good time to push your repository to your GitHub account for the first time.

**4. Set up a new Heroku app and push your repo to it**

Next, it's time to add a new Heroku app that will host our Hubot. Install the [Heroku Toolbelt](https://toolbelt.heroku.com) if you haven't done this yet. Then, in your repo folder, run the following commands:

    heroku login
    heroku apps:create my_hubot_app_name
    git push heroku master

This will take a bit, since Heroku is preparing and installing Node.js and other dependencies of your app. One more thing to do is install the Heroku plug-in [Redis To Go](https://addons.heroku.com/redistogo), which can be done from the command line:

    heroku addons:add redistogo:nano

If you want, you can already test your Hubot instance locally by running `bin/hubot`. Try a `hubot help` and see if something happens. But let's move on to the next step.

**5. Set up Talker**

In your Talker settings, you will find your personal API key. Also, jot down the `id` of your chat room, which is the number found in your Talker URL, i.e. `https://www.talkerapp.com/rooms/{id}`. Pass these settings to your Heroku app via the shell:

    heroku config:add HUBOT_TALKER_TOKEN="{token}"
    heroku config:add HUBOT_TALKER_ROOMS="{id}"

Note that you can use several comma-separated room IDs if you want to enable Hubot in multiple chat rooms.

**6. Test Hubot in Talker**

You're now ready to test Hubot in your Talker chat room. In case you run into any issues, your first bet is always to run a `heroku logs` to start debugging. Also note that the Heroku instance will go idle after an hour of not being in use, so you will have to `heroku restart` it, if the Hubot doesn't respond. A better idea would be to automatically ping the app once in a while to prevent it from going idle.

That is all.
