$ = jQuery

window.CleverClient = ->
  @socket = io.connect('/index')
  @socket.on 'response', =>
    if @callback
      @callback.apply @,  arguments
  this

_.extend window.CleverClient.prototype, {
  write : (message) ->
    @socket.emit 'message', message
  callback : (cb) ->
    @callback = cb
}
