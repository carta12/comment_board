class PostController < ApplicationController
  before_action(:find_post, only: [:show, :edit, :update, :destroy])
  
  
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
    @comments = @post.comments
  end
  
  def edit
  end
  
  def update
    @post.update(
      title:  params[:title],
      content: params[:content]
      )
      
    redirect_to "/post/show/#{params[:id]}"
    
  end
  
  
  
  def destroy
    @post.destroy
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
  
  def find_post
    @post = Post.find(params[:id])
  end
  
  
end
