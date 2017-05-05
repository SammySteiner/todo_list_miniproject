class Api::V1::TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.find_or_create_by(todo_params)
    render json: @todo, status: 201
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render plain: "#{params[:id]}", status: 202
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description)
  end

end
