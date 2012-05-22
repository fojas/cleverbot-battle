CleverBot = require('cleverbot-node')
clever = new CleverBot

module.exports = {
  connection : (socket) ->
    connected = true
    user = ["Bob Loblaw", "Tobias Funke"]
    i = 0

    callback = (data,fn) ->
      socket.emit 'response', {
        user :user[(i = (i+1) % 2)], 
        response : data
      }
      clever.write data, (response) ->
        if connected
          callback response.message, callback

    socket.on 'message', callback

    socket.on 'disconnect', () ->
      connected = false
}
