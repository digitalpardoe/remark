class UserSessionsController < ApplicationController
  layout 'session'
  
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
        format.html {
          if (@user.role?(:admin))
            redirect_to(admin_index_path, :flash => { :success => "Logged in successfully." })
          else
            redirect_to(root_path, :flash => { :success => "Logged in successfully." })
          end
        }
      else
        format.html {
          flash[:error] = "Login unsuccessful."
          redirect_to(new_user_session_path)
        }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    
    respond_to do |format|
      format.html { redirect_to(new_user_session_path, :flash => { :notice => "Logged out." }) }
    end
  end
end
