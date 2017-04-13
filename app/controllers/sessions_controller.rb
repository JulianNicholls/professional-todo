class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by email: session_params[:email].downcase

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully"
      redirect_to user
    else
      flash[:danger] = "We didn't recognise that email and password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit :email, :password
  end
end
