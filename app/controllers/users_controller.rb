class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @user = User.find(params[:id])
    @events = @user.events

    favorites = Favorite.where(user_id: current_user.id).pluck(:event_id)
    @favorite_list = Event.find(favorites) 
  end

  private

  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

end
