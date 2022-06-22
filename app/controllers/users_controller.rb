class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    # @events = current_user.event
  end
end
