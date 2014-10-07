module.exports =
class Todo extends ism.Storage
  type: 'db' # client
  params:
    title: T.string
    user_id: T.string
  validate: ({title, user_id}) ->
    title.length > 2 and user_id
