class UsersController < ApplicationController
  before_action :set_user, :authenticate
  
  def subscribe_login
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path #:notice => "Logged in successfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :template => 'home/login_form'
    end
  end
  
  def subscribe_create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'User successfully added.'
    else
      render :template => 'home/register'
    end    
  end
  
  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end
  
  private

  def set_user
    @user = current_user
  end

  def user_params
    #params.require(:post).permit(:some_attribute).merge(user_id: current_user.id)
    params.require(:user).permit(:some_attribute).merge(user_id: current_user.id)
  end
  
end
