class BlogController < ApplicationController
  def index
    @articles = Article.published.all
  end

  def show
    @article = Article.where(:permalink => params[:permalink]).first
    authorize! :read, @article
  end
end
