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
      destroyed_records = Comment.where(:spam => true).destroy_all
    end
    
    respond_to do |format|
      if params[:id] != "all"
        flash[:notice] = "Comment removed."
      elsif destroyed_records.length > 0
        flash[:notice] = "Comments removed."
      else
        flash[:notice] = "No comments to remove."
      end
      
      format.html { redirect_to(admin_comments_path) }
    end
  end
  
  def toggle
    @comment.toggle
    @comment.save
    redirect_to(admin_comments_path, :notice => "Comment #{@comment.spam ? "rejected" : "approved"}.")
  end
end
