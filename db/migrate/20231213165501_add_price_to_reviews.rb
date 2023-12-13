class AddPriceToReviews < ActiveRecord::Migration[6.1]
  def change
     add_column :reviews, :price, :integer, null: false
  end
end
