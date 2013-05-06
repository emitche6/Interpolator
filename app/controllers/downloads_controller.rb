class DownloadsController < ApplicationController
  def index
    @interpolation = Interpolation.find(params[:interpolation_id])
    @downloads = @interpolation.downloads
  end
  
  def new
    if !current_user
      flash[:notice] = "You must sign in or register to do this."
      redirect_to new_user_path
    else
      @interpolation = Interpolation.find(params[:interpolation_id])
      @download = @interpolation.downloads.build
   end
  end
  
  def create
    @interpolation = Interpolation.find(params[:interpolation_id])
    @download = @interpolation.downloads.build(params[:download])
    @download.user = current_user
    if @download.save
      flash[:notice] = "Successfully created download."
      redirect_to interpolation_url(@download.interpolation_id)
    else
      render :action => 'new'
    end
  end
  
  
  def destroy
    @download = download.find(params[:id])
    if current_user != @download.user
      flash[:notice] = "You can't delete this download."
    else
      @download.destroy
      flash[:notice] = "Successfully destroyed download."
      redirect_to interpolation_url(@download.interpolation_id)
    end
  end
end
