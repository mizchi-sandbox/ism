Todo = require '../storages/todo.coffee'

T = {} # TODO

module.exports =
class Todo extends ism.Resource
  endpoint: '/todos'

  params:
    title: T.string
    user_id: T.string

  validate: ({title, user_id}) ->
    title.length > 2 and user_id

  # /todos
  index: ->
    [{1, 2, 3}]

  # /todos/new
  new: (params, req) -> new Promise (done) ->
    Todo.save(params).then done

  # /todos/:id
  ':id': (param, req) ->
    [{1}]
