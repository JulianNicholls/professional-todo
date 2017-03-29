class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find params[:id]
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
      flash.new[:error] = 'The task could not be saved'
      render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit :name, :description
  end
end
