{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'dice', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      setTimeout done, 10 # wait for parseHelp()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    describe 'valid patterns', ->
      beforeEach ->
        @tests = [
          message: '@hubot 1d1'
          matches: ['@hubot 1d1', '1', '1']
        ,
          message: '@hubot 10d20'
          matches: ['@hubot 10d20', '10', '20']
        ]

      it 'should match', ->
        @tests.forEach ({ message, matches }) =>
          callback = @sinon.spy()
          @robot.listeners[0].callback = callback
          sender = new User 'bouzuya', room: 'hitoridokusho'
          @robot.adapter.receive new TextMessage(sender, message)
          actualMatches = callback.firstCall.args[0].match.map((i) -> i)
          assert callback.callCount is 1
          assert.deepEqual actualMatches, matches

  describe 'listeners[0].callback', ->
    beforeEach ->
      @hello = @robot.listeners[0].callback

    describe 'receive "@hubot 2d6"', ->
      beforeEach ->
        @send = @sinon.spy()
        @hello
          match: ['@hubot 2d6', '2', '6']
          send: @send

      it 'send between 2-12', ->
        result = parseInt(@send.firstCall.args[0], 10)
        assert @send.callCount is 1
        assert result >= 2
        assert result <= 12

  describe 'robot.helpCommands()', ->
    it 'should be ["hubot <M>d<N> - roll M N-sided dice"]', ->
      assert.deepEqual @robot.helpCommands(), [
        "hubot <M>d<N> - roll M N-sided dice"
      ]
