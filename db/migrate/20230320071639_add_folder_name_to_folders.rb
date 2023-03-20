class AddFolderNameToFolders < ActiveRecord::Migration[7.0]
  def change
    add_column :folders, :folderName, :string
  end
end
