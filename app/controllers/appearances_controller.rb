class AppearancesController < ApplicationController
  before_action :logged_in?

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance=set_appearance
  end

  def update
    @appearance= set_appearance
    @appearance.update(appearance_params)
    redirect_to episodes_path
  end

  
  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

  def set_appearance
    Appearance.find(params[:id])
  end

  def logged_in?
    if session[:user_id]
      true
    else
      redirect_to login_path, notice: "You must be logged in"
    end
  end

end
