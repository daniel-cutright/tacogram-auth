class CommentsController < ApplicationController
  def create
    if @current_user != nil
      @comment = Comment.new
      @comment["body"] = params["body"]
      @comment["user_id"] = @current_user["id"]
      @comment["post_id"] = params["post_id"]
      @comment.save
    else
      flash["notice"] = "Please login to submit a comment."
    end
    redirect_to "/posts"
  end
end
