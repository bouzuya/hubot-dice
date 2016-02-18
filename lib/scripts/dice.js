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
    var m, n, _i, _results;
    m = res.match[1];
    n = res.match[2];
    return res.send('' + (function() {
      _results = [];
      for (var _i = 0; 0 <= m ? _i < m : _i > m; 0 <= m ? _i++ : _i--){ _results.push(_i); }
      return _results;
    }).apply(this).reduce(function(s) {
      return s + Math.floor(Math.random() * n) + 1;
    }, 0));
  });
};
