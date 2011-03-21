class Admin::CommentsController < AdminController
  load_and_authorize_resource
  skip_load_resource :only => :destroy
  
  def index
    @comments = Comment.all
  end
  
  def show
    respond_to do |format|
      format.html
    end
  end
  
  def destroy
    unless params[:id] == "all"
      @comment = Comment.find(params[:id])
      @comment.destroy
    else
      Comment.where(:spam => true).destroy_all
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_comments_path, :notice => "Comment#{params[:id] == "all" ? "s" : ""} removed.") }
    end
  end
  
  def toggle
    @comment.spam = !@comment.spam
    @comment.save
    redirect_to(admin_comments_path, :notice => "Comment #{@comment.spam ? "rejected" : "approved"}.")
  end
end
