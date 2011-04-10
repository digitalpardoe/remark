class Admin::ArticlesController < AdminController
  load_and_authorize_resource
  
  def index
    @articles = Article.includes(:tags, :user).all
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
    @article.user = current_user
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to(admin_articles_path, :notice => "Article created.") }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(admin_articles_path, :notice => "Article updated.") }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @article.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_articles_path, :notice => "Article removed.") }
    end
  end
end