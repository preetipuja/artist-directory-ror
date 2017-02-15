class AddNullToArtistId < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:performances, :artist_id, false)
  end
end
