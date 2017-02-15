class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.string :location
      t.date :year_of_birth
      t.timestamps
    end
  end
end
