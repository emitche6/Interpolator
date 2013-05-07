class CommentsController < ApplicationController
  def index
    @interpolation = Interpolation.find(params[:interpolation_id])
    @comments = @interpolation.comments
  end
  
  def new
    if !current_user
      flash[:notice] = "You must sign in or register to do this."
      redirect_to new_user_path
    else
      respond_to do |format|
        format.html { @interpolation = Interpolation.find(params[:interpolation_id])
          @comment = @interpolation.comments.build }
        format.js {}
    end
   end
  end
  
  def create
    @interpolation = Interpolation.find(params[:interpolation_id])
    @comment = @interpolation.comments.build(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html {redirect_to interpolation_url(@comment.interpolation_id), notice: "Successfully created comment."}
        format.js {}
      else
        format.html{render :action => 'new'}
      end
    end
  end
  
  
  def destroy
    @comment = Comment.find(params[:id])
    if current_user != @comment.user
      flash[:notice] = "You can't delete this comment."
    else
      @comment.destroy
      flash[:notice] = "Successfully destroyed comment."
      redirect_to interpolation_url(@comment.interpolation_id)
    end
  end
end
