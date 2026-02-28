class PostsController < ApplicationController

  def index
    @posts = Post.all
    
  end

  def new
    # Redirect if user is not logged in
    if @current_user == nil
      flash["notice"] = "Please login to submit a post."
      redirect_to "/login"
    end
  end
  
  def create
    if @current_user != nil
      @post = Post.new
      @post["body"] = params["body"]
      @post["image"] = params["image"]
      @post["user_id"] = session["user_id"]
      @post.save
    else
      flash["notice"] = "Please login to submit a post."
    end
    redirect_to "/posts"
  end
end
