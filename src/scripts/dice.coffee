# Description
#   A Hubot script that rolls dice
#
# Configuration:
#   None
#
# Commands:
#   hubot <M>d<N> - roll M N-sided dice
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.respond /(\d+)d(\d+)$/i, (res) ->
    m = res.match[1]
    n = res.match[2]
    res.send [0...m].reduce (s) ->
      s + Math.floor(Math.random() * n) + 1
    , 0
