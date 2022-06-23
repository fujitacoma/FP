class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :event_params

  def create
    Favorite.create(user_id: current_user.id, event_id: params[:id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, event_id: params[:id]).destroy
  end

  private
  
  def event_params
    @event = Event.find(params[:id])
  end

end