class Api::TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todo = Todo.find_by_id(params[:id])
    render json: @todo
  end

  def create
    @todo = Todo.create!(todo_params)
    render json: @todo
  end

  def update
    @todo = Todo.find_by_id(params[:id])
    @todo.update!(todo_params)
    render json: @todo
  end

  def destroy
    @todo = Todo.find_by_id(params[:id])
    @todo.delete
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end

end
