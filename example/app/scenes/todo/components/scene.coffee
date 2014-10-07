React = require 'react'

$ = React.DOM
module.exports = Todo = React.createClass
  render: ->
    todos = @state.todos
    $.div {}, [
      $.h1 {}, 'TODO'
      $.ul {}, todos.map (todo) -> $.li {}, todo.title
    ]
