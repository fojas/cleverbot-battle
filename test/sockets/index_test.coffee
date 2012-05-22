sockets = require '../../lib/sockets'
should = require('should')

describe "Socket", ->
  describe "Index", ->
    it "should have an index channel", ->
      should.exist sockets.index

    it "should have a connection callback for index", ->
      should.exist sockets.index.connection
