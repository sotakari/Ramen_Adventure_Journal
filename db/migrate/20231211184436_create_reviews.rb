class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :shop_name
      t.string :ramen_name
      t.text :review_comment

      t.timestamps
    end
  end
end
