class BlogController < ApplicationController
  def index
    @articles = Article.published.all
  end

  def show
    @article = Article.published.where(:permalink => params[:permalink]).first
  end
end
