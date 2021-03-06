class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "You have signed up successfully"
      redirect_to @user
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update user_params
      flash[:success] = "You have updated your profile successfully"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "The user and their tasks have been deleted successfully"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def set_user
    @user = User.find params[:id]
  end

  def require_same_user
    unless current_user == @user || current_user.admin?
      flash[:danger] = 'You can only edit and delete your own account'
      redirect_to users_path
    end
  end
end
