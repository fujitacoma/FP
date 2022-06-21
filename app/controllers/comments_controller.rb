class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @event = Event.find(params[:event_id])
    if @comment.save
      CommentChannel.broadcast_to @event, { comment: @comment, user: @comment.user }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end

