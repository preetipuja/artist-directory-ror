class RenameDocumentFileNameToImageFileName < ActiveRecord::Migration[5.0]
  def change
     rename_column :photos, :document_file_name, :image_file_name
  end
end
