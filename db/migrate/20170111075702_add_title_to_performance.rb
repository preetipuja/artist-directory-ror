class AddTitleToPerformance < ActiveRecord::Migration[5.0]
  def change
   add_column :performances, :title, :string
  end
end
