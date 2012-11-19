class BlogController < ApplicationController
  caches_action :index, :cache_path => Proc.new { |c| c.params }
  caches_action :show
  
  def index
    @articles = Article.published.includes(:tags, :user)
    @articles = @articles.where('body LIKE ? or title LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%") unless !params[:query]

    respond_to do |format|
      format.html {
        @articles = @articles.paginate(:page => params[:page], :per_page => setting(:per_page).to_i)
      }
      
      format.rss {
        if (setting(:feedburner_stub) || "").empty? or request.env['HTTP_USER_AGENT'] =~ /FeedBurner/i
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
