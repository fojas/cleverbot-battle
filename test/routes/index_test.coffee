routes =  require ('../../routes')
should = require('should')

describe 'Routes', ->
  describe 'Index', ->
    it 'should respond to default route', (done)->
      routes.index {}, {
        render: (viewName,options) ->
          viewName.should.equal("index")
          options.title.should.equal("Express")
          done()
      }
