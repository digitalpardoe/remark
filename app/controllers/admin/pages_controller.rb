class Admin::PagesController < AdminController
  load_and_authorize_resource
  
  def index
    @pages = Page.all
  end

  def new
    @pages = Page.where(:page_id => nil).select([:id, :title]).all
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @pages = Page.where(:page_id => nil).where("id != ?", params[:id]).select([:id, :title]).all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @page.user = current_user
    
    respond_to do |format|
      if @page.save
        format.html { redirect_to(admin_pages_path, :notice => "Page created.") }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(admin_pages_path, :notice => "Page updated.") }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @page.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_pages_path, :notice => "Page removed.") }
    end
  end
end
