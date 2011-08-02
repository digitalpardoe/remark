class PageController < ApplicationController
  caches_action :show, :cache_path => Proc.new { |controller| controller.params }
  
  def show
    @page = Page.where(:permalink => params[:permalink]).first
    authorize! :read, @page
  end
end
