class PageController < ApplicationController
  def show
    @page = Page.where(:permalink => params[:permalink]).first
    authorize! :read, @page
  end
end
