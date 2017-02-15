class AddArtistToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :artist, foreign_key: true
  end
end
