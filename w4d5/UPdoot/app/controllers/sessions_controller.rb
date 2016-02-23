class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      session[:session_token] = @user.reset_session_token!
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      @user = User.new(user_name: params[:user][:user_name])
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to root_url
  end
end
