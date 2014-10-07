g = window ? global
_ = require 'lodash'

g.ism = {}
ism.isClient = window? and g is window
ism.isServer = g is global

ism.run = ->
  throw 'should override'

class ism.Storage
  endpoint: null
  schema: {}

  @extend: (obj) ->
    class extends ism.Storage
      _.extend @::, obj

  @fetch: ->
    throw 'should implement fetch'

  save: ->
    throw 'should implement save'
