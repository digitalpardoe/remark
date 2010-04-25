class UserSessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:password])
    
    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        format.html { redirect_to(new_user_session_path, :notice => "Logged in successfully.") }
      else
        format.html { redirect_to(new_user_session_path, :notice => "Login unsuccessful.") }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    
    respond_to do |format|
      format.html { redirect_to(new_user_session_path, :notice => "Logged out.") }
    end
  end
end
