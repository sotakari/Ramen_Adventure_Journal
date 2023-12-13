class AddNotNullToReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :shop_name, :string, null: false
    change_column :reviews, :ramen_name, :string, null: false
    change_column :reviews, :review_comment, :text, null: false
  end
end
