Todo = require 'app/storages/todo'
# currentUser = require 'app/current-user'
TodoScene = require './components/scene'

module.exports = (controller, state) ->
  # for router event
  controller.on ':enter', (params) ->
    Todo.where(id: currentUser.id).then (todos) ->
      state.update(
        todos: params.todos
      ).then ->
        controller.mount('body', TodoScene)

  # for event
  controller.on 'save-item', (params) ->
    todo = new Todo
      title: params.title

    todo.save().then (viewState) ->
      state.update viewState
      # state.addItem {title: params.title}
