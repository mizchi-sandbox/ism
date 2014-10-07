require './shared'
# request = require('superagent')

class ism.Storage
  endpoint: null

host = 'http://localhost:3333'

ism.Storage.fetch = (params) -> new Promise (done, reject) =>
  console.log 'ep', @::endpoint
  $.get(host+'/api'+@::endpoint).done (data) -> done data

ism.Storage::save = -> new Promise (done, reject) =>
  params = {}
  for own k, v of @ then params[k] = v

  $.post(host+'/api'+@endpoint, params).done (data) -> done(data)
  # $.ajax
  #   type: 'POST'
  #   url: host+'/api'+@endpoint
  #   data: params
  #   dataType: 'json'
  #   success: (ret) ->
  #     done(ret)

ism.run = ->
  window.Todo = class Todo extends ism.Storage
    @model = null
    endpoint: '/todos'
    schema:
      title: String
    # fetch: (query = {}) ->
    #   Todo.model.find query, (err, content) -> cb(null, content)

  console.log 'client started'
