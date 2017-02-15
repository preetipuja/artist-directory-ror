class RenameDocumentFileSizeToImageFileSize < ActiveRecord::Migration[5.0]
  def change
     rename_column :photos, :document_file_size, :image_file_size
  end
end
