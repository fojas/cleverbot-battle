
io = require 'socket.io'
express = require 'express'
handlebars = require 'hbs'

routes = require './routes'
sockets = require './lib/sockets'
handlebar_helpers = require('./lib/handlebar_helpers')(handlebars)

app = module.exports = express.createServer()

app.configure () ->
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'hbs'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static("#{__dirname}/public")
  app.use require('connect-assets') src : "#{__dirname}/public"


app.configure 'development', () ->
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))


app.configure 'production', () ->
  app.use(express.errorHandler())

app.get('/', routes.index)

app.listen process.env.PORT || 3000, () ->
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env)

sio = io.listen(app)

if process.env.HEROKU
  sio.configure () ->
    sio.set "transports", ["xhr-polling"]
    sio.set "polling duration", 10

for own attr, command of sockets
  sio.of('/'+attr).on('connection', command.connection) 
