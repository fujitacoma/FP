class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @event = Event.find(params[:event_id])
    CommentChannel.broadcast_to @event, { comment: @comment, user: @comment.user } if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
