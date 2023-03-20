class FoldersController < ApplicationController
  before_action :find_folder, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @folders = current_user.folders
    else
      redirect_to new_user_session_path, notice: 'Please sign in to view your folders.'
    end
  end

  def show
  end

  def new
    @folder = current_user.folders.build
  end

  def create
    @folder = current_user.folders.build(folder_params)
    @folder.files.attach(params[:folder][:files])
  
    if @folder.save
      redirect_to folders_path, notice: 'Folder created successfully.'
    else
      render :new
    end
  end  

  def edit
  end

  def update
    if @folder.update(folder_params)
      if params[:folder][:files].present?
        @folder.files.attach(params[:folder][:files])
      end
      redirect_to folders_path, notice: 'Folder updated successfully.'
    else
      render :edit
    end
  end
  

  def destroy
    @folder.destroy
    redirect_to folders_path, notice: 'Folder deleted successfully.'
  end

  private

  def folder_params
    params.require(:folder).permit(:folderName, files: [])
  end

  def find_folder
    @folder = current_user.folders.find(params[:id])
  end
end
