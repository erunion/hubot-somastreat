## hubot-somastreat [![NPM version](https://badge.fury.io/js/hubot-somastreat.png)](http://badge.fury.io/js/hubot-somastreat)

A [Hubot](https://github.com/github/hubot) plugin to tell you what vendors are at the
[SOMA StrEat Food Park](http://somastreatfoodpark.com/) today.

### Usage

    hubot somatrucks - Pulls todays food truck vendors

#### Configuration

Since SOMA StrEat Food Park puts their daily vendor lists on Twitter, this plugin utilizes the Twitter API. As such,
[you'll need to create a Twitter application to use this plugin.](https://apps.twitter.com/)

Once you have a consumer key and secret key, you can go ahead and set up some environment variables for this plugin.

#### Heroku

    % heroku config:add HUBOT_TWITTER_KEY="key"
    % heroku config:add HUBOT_TWITTER_SECRET="secret"
    % heroku config:add HUBOT_TWITTER_TOKEN="token"
    % heroku config:add HUBOT_TWITTER_TOKEN_SECRET="secret"

#### Non-Heroku environment variables

    % export HUBOT_TWITTER_KEY="key"
    % export HUBOT_TWITTER_SECRET="secret"
    % export HUBOT_TWITTER_TOKEN="token"
    % export HUBOT_TWITTER_TOKEN_SECRET="secret"

### Installation
1. Edit `package.json` and add `hubot-somastreat` as a dependency.
2. Add `"hubot-somastreat"` to your `external-scripts.json` file.
3. `npm install`
4. Reboot Hubot.
