class CommentsController < ApplicationController

  def create

    @c = Comment.new
    @c.text = params[:text]
    @c.violation_id = params[:violation_id]
    @c.user_id = current_user.id
    @c.save

    redirect_to violation_url(params[:violation_id])

  end

  def upvote
    comment = Comment.find_by_id(params[:comment_id])
    comment.upvote += 1
    comment.save

    redirect_to violation_url(params[:violation_id])
  end

  def downvote
    comment = Comment.find_by_id(params[:comment_id])
    comment.downvote += 1
    comment.save

    redirect_to violation_url(params[:violation_id])
  end
end
