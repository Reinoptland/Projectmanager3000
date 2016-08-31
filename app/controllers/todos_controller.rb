class TodosController < ApplicationController
  before_action :load_todo, except: [:index, :create]

  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    render_todo
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render_todo status: :created
    else
      render_errors
    end
  end

  def update
    if @todo.update(todo_params)
      render_todo status: 226
    else
      render_errors
    end
  end

  def destroy
    if @todo.destroy
      head :ok
    else
      render_errors "Could not destroy this todo, sorry"
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end

  def render_todo(status:  200)
    render json: @todo, status: status
  end

  def render_errors(errors = nil)
    errors ||= @todo.errors
    render json: { errors: errors }, status: :unprocessible_entity
  end

  def load_todo
    @todo = Todo.find(params[:id])
  end
end
