class AddRatingsToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :all_rating, :float, null: false, default: 0.0
    add_column :reviews, :noodle_rating, :float, null: false, default: 0.0
    add_column :reviews, :soup_rating, :float, null: false, default: 0.0
    add_column :reviews, :topping_rating, :float, null: false, default: 0.0
  end
end
