class PageController < ApplicationController
  def show
    @page = Page.published.where(:permalink => params[:permalink]).first
  end
end
