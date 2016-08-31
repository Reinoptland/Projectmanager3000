class AddTodolistToTodo < ActiveRecord::Migration[5.0]
  def change
    add_reference :todos, :todo, foreign_key: true
  end
end
