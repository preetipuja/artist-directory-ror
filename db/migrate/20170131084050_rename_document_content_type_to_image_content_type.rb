class RenameDocumentContentTypeToImageContentType < ActiveRecord::Migration[5.0]
  def change
     rename_column :photos, :document_content_type, :image_content_type
  end
end
