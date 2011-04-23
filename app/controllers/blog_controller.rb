class BlogController < ApplicationController
  def index
    @articles = Article.published.includes(:tags, :user)
    
    respond_to do |format|
      format.html {
        @articles = @articles.paginate(:page => params[:page], :per_page => Setting.application.value(:per_page))
      }
      
      format.rss {
        if Setting.application.value(:feedburner_stub).empty? or request.env['HTTP_USER_AGENT'] =~ /FeedBurner/i
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
