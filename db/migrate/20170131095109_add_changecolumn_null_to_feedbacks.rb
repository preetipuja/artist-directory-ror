class AddChangecolumnNullToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    change_column_null :feedbacks, :artist_id, false
    change_column_null :feedbacks, :user_id, false
  end
end
