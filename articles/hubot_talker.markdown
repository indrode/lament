Hubot is a GitHub product that adds automation to a group chat room. It's written in CoffeeScript and Node.js and ships with a small set of core scripts that can be run from within a chat, such as searching for images, sending tweets, and more. Read all about it on Hubot's own official page: [http://hubot.github.com](http://hubot.github.com).

This quick step-by-step guide sets up a Hubot to be used in a Talker chat room ([http://talkerapp.com](http://talkerapp.com)), so the first thing to do is to sign up for a Talker account and set up a chat room. It's free. This also assumes that you have a GitHub account and a verified Heroku account, since we're deploying our Hubot instance to this service.

**1. Create and clone a new GitHub repo**

This takes about 10 seconds if you have done it before.

**2. Download Hubot from [http://hubot.github.com](http://hubot.github.com) and add it to your repo**

Now, there are a few changes to be made in `package.json`. First, we update the actual Hubot version used as a dependency. Next, we specify the Node.js and `npm` versions. Finally, we add add a `hubot-talker` dependency. In the end, `package.json` should like something like this:

    {
      "name":        "hosted-hubot",
      "version":     "2.4.6",
      "author":      "GitHub Inc.",
      "keywords":    "github hubot campfire bot",
      "description": "A simple helpful Robot for your Company",
      "licenses":     [{
        "type":       "MIT",
        "url":        "http://github.com/github/hubot/raw/master/LICENSE"
      }],

      "engines": {
        "node": "0.8.19",
        "npm":  "1.2.10"
      },

      "repository" : {
        "type" : "git",
        "url" : "http://github.com/github/hubot.git"
      },

      "dependencies": {
        "hubot-talker": ">= 1.0.1",
        "hubot": "2.4.6",
        "hubot-scripts": ">=2.0.8",
        "optparse": "1.0.3"
      }
    }

Check the [Heroku developer guides](https://devcenter.heroku.com/articles/nodejs-versions) for information on current `node` and `npm` versions. Of course, you could also use wildcards.

**3. Make, commit, and push your repo changes**

After you've made the changes above, it would be a good time to push your repository to your GitHub account.

**4. Set up a new Heroku app and push your repo to it**

Now it's time to add a new Heroku app that will host our Hubot. Install the [Heroku Toolbelt](https://toolbelt.heroku.com) if you haven't done it yet. Then, in your repo folder run the following commands:

    heroku login
    heroku apps:create my_hubot_app_name
    git push heroku master

This will take a bit, since Heroku is preparing and installing Node.js and other dependencies of your app. When done, one more thing to do is install the Heroku plug-in `Redis To Go` ([https://addons.heroku.com/redistogo](https://addons.heroku.com/redistogo)). This can be done from the command line:

    heroku addons:add redistogo:nano

If you want, you can already test your Hubot instance locally by running `bin/hubot`. Try a `hubot help` and see if stuff happens. But let's move on to the next step.

**5. Set up Talker**

In your Talker settings, you will find your API key. Also, not the `id` of your chat room, which is the number found in your Talker URL, i.e. `https://www.talkerapp.com/rooms/{id}`. Pass these settings to our Heroku app:

    heroku config:add HUBOT_TALKER_TOKEN="{token}"
    heroku config:add HUBOT_TALKER_ROOMS="{id}"

Note that you can use several comma-separated room IDs, if you want to enable Hubot in multiple chat rooms.

**6. Test Hubot in Talker**

You're now ready to test Hubot in your Talker chat room. In case you run into any issues, you're first bet is to run a `heroku logs` to start debugging. Also note that our Heroku instance will go idle after an hour if it is not in use, so you will have to `heroku restart` it, if the Hubot doesn't respond. A better idea would be to automatically ping the app once in a while to prevent it from going idle.

That is all.



