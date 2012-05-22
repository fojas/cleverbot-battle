module.exports = (handlebars) ->
  handlebars.registerHelper 'js', (options) ->
    return js options.hash.file

  handlebars.registerHelper 'css', (options) ->
    return css options.hash.file
