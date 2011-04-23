class BlogController < ApplicationController
  def index
    @articles = Article.published.includes(:tags, :user).paginate(:page => params[:page], :per_page => Setting.application.value(:per_page))
  end

  def show
    @article = Article.where(:permalink => params[:permalink]).includes(:tags, :user).first
    authorize! :read, @article
  end
end
