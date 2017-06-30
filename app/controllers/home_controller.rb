class HomeController < ApplicationController
  def index
    @posts = post.all
  end

  def create
  end

  def read
    @post=Post.find(params[:post_id])
  end

  def update
    @post=Post.find(params[:post_id])
  end
  
  def new
    @post = Post.new
    @post.title = params[:satang]
    @post.content = params[:kimbab]
    # @post.user = current_user
    @post.save
      redirect_to "/home/index"
  end
  
  def edit
    post=Post.find(params[:post_id])
    post.title = params[:satang]
    post.content = params[:kimbab]
    post.save
    redirect_to "/home/index"
  end
  
  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to "/home/index"
  end
  
  def comment
    comment = Comment.new
    comment.content = params[:comment_id]
    comment.post_id = params[:comment_hidden]
    # comment.user = current_user
    comment.save
    redirect_to "/home/read/#{comment.post.id}"
  end
  
  def comment_delete
    comment = Comment.find(params[:comment_id])
    comment.destroy
    redirect_to "/home/read/#{comment.post.id}"
  end
end