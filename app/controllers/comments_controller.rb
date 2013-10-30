class CommentsController < ApplicationController

  def create
    c = Comment.new
    c.text = params[:text]
    c.call_id = params[:call_id]
    c.save

    redirect_to call_url(params[:call_id])
  end

end
