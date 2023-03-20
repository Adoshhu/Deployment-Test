class FoldersController < ApplicationController
  def index
    @folders = Folder.all
  end

  def show
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)

    if @folder.save
      redirect_to '/folders', notice: 'Created'
    else
      redirect_to '/folders/new', notice: 'Failed'
    end
  end

  def edit
    find_folder
  end

  def update
    find_folder

    if @folder.update(folder_params)
      redirect_to '/folders', notice: 'Updated'
    else
      redirect_to '/folders/edit', notice: 'Failed'
    end
  end

  def destroy
      find_folder
      @folder.destroy
      redirect_to '/folders', notice: 'Deleted'

  end

  private

  def folder_params
    params.require(:folder).permit(:folderName, :content)
  end

  def find_folder
    @folder = Folder.find_by(id: params[:id])
  end
end
