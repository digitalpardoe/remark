class BlogController < ApplicationController
  caches_action :index, :cache_path => Proc.new { |controller| controller.params }, :if => Proc.new { |c| !c.request.format.rss? }
  caches_action :show
  
  def index
    @articles = Article.published.includes(:tags, :user)
    @articles = @articles.where('body LIKE ? or title LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%") unless !params[:query]
    
    respond_to do |format|
      format.html {
        @articles = @articles.paginate(:page => params[:page], :per_page => Setting.application.value(:per_page))
      }
      
      format.rss {
        if (Setting.application.value(:feedburner_stub) || "").empty? or request.env['HTTP_USER_AGENT'] =~ /FeedBurner/i
          @articles = @articles.limit(10)
          render :layout => false
        else
          redirect_to feedburner_url
        end
      }
    end
  end

  def show
    @article = Article.where(:permalink => params[:permalink]).includes(:tags, :user).first
    authorize! :read, @article
  end
end
