class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def show

  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new todo_params

    if @todo.save
      flash[:notice] = 'The new task was saved successfully'
      redirect_to @todo
    else
      flash.now[:error] = 'The task could not be saved'
      render :new
    end
  end

  def edit

  end

  def update
    if @todo.update todo_params
      flash[:notice] = 'The task was updated successfully'
      redirect_to @todo
    else
      flash.now[:error] = 'The task could not be updated'
      render :edit
    end
  end

  def destroy
    if @todo.destroy
      flash[:notice] = 'The task was deleted successfully'
      redirect_to todos_path
    else
      flash.now[:error] = 'The task could not be updated'
      redirect_back
    end
  end

  private

  def todo_params
    params.require(:todo).permit :name, :description
  end

  def set_todo
    @todo = Todo.find params[:id]
  end
end
