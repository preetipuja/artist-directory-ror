class DatabaseLevelValidation < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:artists, :name, false)
    change_column_null(:artists, :email, false)
    change_column_null(:artists, :location, false)
    change_column_null(:categories, :category_name, false)
    change_column_null(:performances, :perform, false)
  end
end
