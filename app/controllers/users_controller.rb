class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @user = User.find(params[:id])
    @events = Event.order("created_at DESC")
  end

  private

  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

end
