class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html
    end
  end

  def new
    respond_to do |format|
      format.html
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def create
    respond_to do |format|
      if @user.save
        format.html { redirect_to(admin_users_path, :notice => "User created.") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(admin_users_path, :notice => "User updated.") }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    # TODO: Handle if the user isn't deleted because it's the last admin user.
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_users_path, :notice => "User removed.") }
    end
  end
end
