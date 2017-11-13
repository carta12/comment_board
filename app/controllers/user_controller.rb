class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @email = params[:email]
    @password = params[:password]
    
    User.create(
      email: @email,
      password: @password
      )
      
    redirect_to '/user/index'
  end

  def show
    @id = params[:id]
    @user = User.find(@id)
  end
  
  def login
  end
  
  def login_process
    @email = params[:email]
    @password = params[:password]
    @message = ""
    
    user = User.find_by(email: @email)
    
    if user
      if user.password == @password
        session[:user_email] = user.email
        session[:id] = user.id
        flash[:notice] = "로그인 되었습니다."
        redirect_to '/'
      else
        flash[:notice] = "패스워드를 다시 확인해 주세요"
        redirect_to '/user/login'
        # @message = "패스워드를 다시 확인해 주세요"
      end
    else
      #@message = "이메일이 잘못되었거나 존재하지 않습니다."
      flash[:notice] = "이메일이 잘못되었거나 존재하지 않습니다."
      redirect_to '/user/login'
    end
  end
  
  def logout
    session.clear
    flash[:notice] = "로그아웃 되었습니다."
    redirect_to '/'
  end
  
  
  
end
