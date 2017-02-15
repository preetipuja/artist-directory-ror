class AddCategoryToArtists < ActiveRecord::Migration[5.0]
  def change
    add_reference :artists, :category, index: true, foreign_key: true
  end
end
