class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = Event.order("created_at DESC")
  end
end
