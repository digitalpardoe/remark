class Admin::CommentsController < AdminController
  load_and_authorize_resource
  
  def index
    @comments = Comment.all
  end
  
  def show
    respond_to do |format|
      format.html
    end
  end
  
  def destroy
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_comments_path, :notice => "Comment removed.") }
    end
  end
end
