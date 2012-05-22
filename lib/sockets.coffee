require("fs").readdirSync("./sockets").forEach (file) ->
  module.exports[file.split('.')[0]] = require("../sockets/" + file)
