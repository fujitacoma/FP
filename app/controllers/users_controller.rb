class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events

    favorites = Favorite.where(user_id: current_user.id).pluck(:event_id)
    @favorite_list = Event.find(favorites) 
  end
end
