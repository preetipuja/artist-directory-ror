class RemoveAttachmentImageFromArtists < ActiveRecord::Migration[5.0]
  def change
     remove_attachment :artists, :image
  end
end
