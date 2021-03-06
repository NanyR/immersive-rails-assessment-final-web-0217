class UsersController < ApplicationController

  def new
    @user= User.new
  end

  def create
    @user=User.create(user_params)
    if @user.valid?
      session[:user_id]= @user.id
      redirect_to episodes_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
