class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @title = params[:title]
    @content = params[:content]
    @user_id = session[:id]
    Post.create(
      title: @title,
      content: @content,
      user_id: @user_id
      )
      
    redirect_to '/'
  end

  def show
    @id = params[:id]
    
    @post = Post.find(@id)
    @comments = @post.comments
  end
  
  def modify
    @id = params[:id]
    @post = Post.find(@id)
  end
  
  def update
    @id = params[:id]
    @title = params[:title]
    @content = params[:content]
    
    post = Post.find(@id)
    post.update(
      title: @title,
      content: @content
      )
      
    redirect_to "/post/show/#{@id}"
    
  end
  
  
  
  def destroy
    @id = params[:id]
    
    post = Post.find(@id)
    post.destroy
    redirect_to '/'
  end
  
  def create_comment
    @comment = params[:comment]
    @post_id = params[:post_id]
    
    Comment.create(
      post_id: @post_id,
      content: @comment
      )
    
    redirect_to :back
    
  end
  
end
