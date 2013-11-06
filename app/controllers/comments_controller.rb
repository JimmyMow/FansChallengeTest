class CommentsController < ApplicationController

  def create

    @c = Comment.new
    @c.text = params[:text]
    @c.violation_id = params[:violation_id]
    @c.foul_id = params[:foul_id]
    @c.user_id = current_user.id
    @c.save

    if @c.violation_id.present?
      redirect_to violation_url(params[:violation_id])
    elsif @c.foul_id.present?
      redirect_to foul_url(params[:foul_id])
    end
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
