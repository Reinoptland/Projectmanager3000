
class AddProjectToTodolist < ActiveRecord::Migration[5.0]
  def change
    add_reference :todo_lists, :todo_list, foreign_key: true
  end
end
