// Description
//   A Hubot script that rolls dice
//
// Configuration:
//   None
//
// Commands:
//   hubot <M>d<N> - roll M N-sided dice
//
// Author:
//   bouzuya <m@bouzuya.net>
//
module.exports = function(robot) {
  return robot.respond(/(\d+)d(\d+)$/i, function(res) {
    var i, m, n, results;
    m = res.match[1];
    n = res.match[2];
    return res.send('' + (function() {
      results = [];
      for (var i = 0; 0 <= m ? i < m : i > m; 0 <= m ? i++ : i--){ results.push(i); }
      return results;
    }).apply(this).reduce(function(s) {
      return s + Math.floor(Math.random() * n) + 1;
    }, 0));
  });
};
