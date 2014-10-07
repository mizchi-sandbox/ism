require './shared'

mongoose = require('mongoose');
mount = require('koa-mount')

koa = require('koa')
bodyParser = require('koa-body-parser');
Router = require('koa-router')
cors = require 'koa-cors'

route = new Router()
mongoose.connect('mongodb://localhost/test')

ism.Storage.fetch = (query = {}) -> new Promise (done) =>
  @model.find query, (err, content) -> done(content)

ism.Storage::save = -> Promise (done) =>
  model = new @constructor.model {title: 'dummy'}
  model.save (err, data) -> done(data)

ism.Storage.mount = (Storage) ->
  Model = mongoose.model Storage.name, Storage::schema
  Storage.model = Model

  # fetch
  route.get Storage::endpoint, ->
    console.log 'fetching'
    query = @request.query ? {}
    @body = yield (cb) ->
      Storage.fetch(query).then (content) -> cb null, content

  # save
  route.post Storage::endpoint, ->
    console.log 'saving'
    @body = yield (cb) ->
      model = new Model {title: 'dummy'}
      model.save (err, data) ->
        cb(null, {error: err})

ism.run = ->
  class Todo extends ism.Storage
    @model = null
    endpoint: '/todos'
    schema:
      title: String

  ism.Storage.mount Todo
  app = koa()
  app.use cors()
  app.use mount('/api', route.middleware())
  app.listen 3333
  console.log 'server started'

ism.run()
