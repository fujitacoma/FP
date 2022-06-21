class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @events = Event.order("created_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def move_to_index
    redirect_to root_path unless @event.user == current_user
  end

  def event_params
    params.require(:event).permit(:event_name, :content, :prefecture_id, :date, :official_link, :youtube_link, :instagram_link, :twitter_link, :image).merge(user_id: current_user.id)
  end

end
