class BlogController < ApplicationController
  def index
    @articles = Article.published.includes(:tags, :user)

    respond_to do |format|
      format.html {
        if (params[:year] && params[:month])
          date = Date.new(params[:year].to_i, params[:month].to_i, 1)
          @articles = @articles.where("published_at >= ? and published_at <= ?", date.beginning_of_month, date.end_of_month)
        else
          @articles = @articles.paginate(:page => params[:page], :per_page => setting(:per_page).to_i)
        end
      }
      
      format.rss {
        @articles = @articles.limit(10)
        render :layout => false
      }
    end
  end

  def show
    @article = Article.where(:permalink => params[:permalink]).includes(:tags, :user).first
    authorize! :read, @article
  end
end
