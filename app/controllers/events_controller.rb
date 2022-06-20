class EventsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  # before_action :move_to_index, expect: [:index]

  def index
    # @events = Events.all
  end

  def new
  end

  def create
  end

  private

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

end
