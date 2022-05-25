class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @therapy = Therapy.find(params[:therapy_id])
    if @comment.save
      CommentChannel.broadcast_to @therapy, { comment: @comment, user: @comment.user }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, therapy_id: params[:therapy_id])
  end
end
