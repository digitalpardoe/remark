class Admin::PagesController < AdminController
  load_and_authorize_resource

  def index
    @pages = Page.includes(:user).all
    authorize! :manage, Page
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
    @page.user = current_user
    
    respond_to do |format|
      if @page.save
        format.html { redirect_to(admin_pages_path, :flash => { :success => "Page created." }) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(admin_pages_path, :flash => { :info => "Page updated." }) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @page.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_pages_path, :flash => { :error => "Page removed." }) }
    end
  end
  
  def up
    @page.up
    @page.save
    
    respond_to do |format|
        format.html { redirect_to(admin_pages_path, :flash => { :info => "Page order changed." }) }
    end
  end
    
  def down
    @page.down
    @page.save

    respond_to do |format|
      format.html { redirect_to(admin_pages_path, :flash => { :info =>  "Page order changed." }) }
    end
  end
end
