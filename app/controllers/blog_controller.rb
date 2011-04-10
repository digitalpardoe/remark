class BlogController < ApplicationController
  def index
    @articles = Article.published.includes(:tags, :user).all
  end

  def show
    @article = Article.where(:permalink => params[:permalink]).includes(:tags, :user).first
    authorize! :read, @article
  end
end
