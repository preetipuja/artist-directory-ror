class RenameDocumentUpdatedAtToImageUpdatedAt < ActiveRecord::Migration[5.0]
  def change
     rename_column :photos, :document_updated_at, :image_updated_at
  end
end
