# hubot-dice

A Hubot script that rolls dice

## Installation

    $ npm install git://github.com/bouzuya/hubot-dice.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-dice.git#TAG'

## Example

    bouzuya> hubot help dice
      hubot> hubot <M>d<N> - roll M N-sided dice

    bouzuya> hubot 1d1
      hubot> 1
    bouzuya> hubot 2d6
      hubot> 7
    bouzuya> hubot 1d100
      hubot> 53

## Configuration

See [`src/scripts/dice.coffee`](src/scripts/dice.coffee).

## Development

`npm run`

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/bouzuya/hubot-dice
[travis-badge]: https://travis-ci.org/bouzuya/hubot-dice.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-dice
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-dice.png
[coveralls]: https://coveralls.io/r/bouzuya/hubot-dice
[coveralls-badge]: https://img.shields.io/coveralls/bouzuya/hubot-dice.svg
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
