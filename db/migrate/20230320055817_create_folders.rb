class CreateFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :folders do |t|
      t.string "folderName"
      t.timestamps
    end
  end
end
