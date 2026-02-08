class Admin::ArticlesController < AdminController
  load_and_authorize_resource

  before_action :expire_archive, only: [:create, :update, :destroy]

  def index
    @articles = Article.includes(:tags, :user).load
    authorize! :manage, Article
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
        format.html { redirect_to(admin_articles_path, :flash => { :success => "Article created." }) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to(admin_articles_path, :flash => { :info => "Article updated." }) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_path, :flash => { :error => "Article removed." }) }
    end
  end

  private
  def expire_archive
    expire_fragment('archive')
  end

  def article_params
    params.require(:article).permit(:title, :body, :excerpt, :permalink, :draft, :published_at, :text_filter, :url, :link_article, :composite_tags)
  end
end
