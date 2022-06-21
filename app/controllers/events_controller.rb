class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :content, :prefecture_id, :date, :official_link, :youtube_link, :instagram_link, :twitter_link, :image).merge(user_id: current_user.id)
  end

  def find_params
    @event = Event.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless @event.user == current_user
  end

end
