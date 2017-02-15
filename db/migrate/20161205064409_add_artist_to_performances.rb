class AddArtistToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :artist, index: true, foreign_key: true
  end
end
