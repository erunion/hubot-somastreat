# Description:
#   What's vendors are at the SOMA StrEat Food Park today?
#
# Dependencies:
#   "moment": "2.0.x"
#   "twitter": "^0.2.9"
#
# Configuration:
#   HUBOT_TWITTER_KEY - Twitter API consumer key
#   HUBOT_TWITTER_SECRET - Twitter API consumer secret
#   HUBOT_TWITTER_TOKEN - Twitter API access token key
#   HUBOT_TWITTER_TOKEN_SECRET - Twitter API access token secret
#
# Commands:
#   hubot somastreat - Pulls todays food truck vendors
#
# Author:
#   jonursenbach

util = require 'util'
moment = require 'moment'
twitter = require 'twitter'

module.exports = (robot) =>
  robot.respond /somastreat$/i, (msg) ->
    twit = new twitter({
        consumer_key: process.env.HUBOT_TWITTER_KEY,
        consumer_secret: process.env.HUBOT_TWITTER_SECRET,
        access_token_key: process.env.HUBOT_TWITTER_TOKEN,
        access_token_secret: process.env.HUBOT_TWITTER_TOKEN_SECRET
    })

    today = moment().format('M/D').toLowerCase()

    twit.search 'from:SoMaStrEatFood "' + today + ' lunch"', (data) ->
        if typeof data.statuses == 'undefined'
            errors = JSON.parse(data.data).errors[0]
            return msg.send "Sorry, unable to pull SOMA StrEat Food Park vendors: " + errors.message
        else if typeof data.statuses[0] == 'undefined'
            return msg.send "Todays SOMA StrEat Food Park vendor list hasn't been posted yet."

        return msg.send 'https://twitter.com/SoMaStrEatFood/status/' + data.statuses[0].id_str
