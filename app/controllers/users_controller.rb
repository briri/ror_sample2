class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.new
  end

  def login
    @user = User.where(login: params[:login])

    @msg = "#{@user.inspect}<br /><br />#{params.inspect}<br /><br />"

    unless @user.nil?
      if @user.password == params[:password]
        session[:user_id] = @user.id

        redirect_to posts_path
      else
        @msg += "Invalid password!"
        render 'show'
      end
    else
      @msg += "Invalid login!"
      render 'show'
    end

  end

  def logout
    @user = session[:user_id]

    unless @user.nil?
      session[:user_id] = nil
    end

    redirect_to posts_path
  end

  def create
    @user = User.new(params[:user].permit(:login, :email, :password))

    if @user.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

end
