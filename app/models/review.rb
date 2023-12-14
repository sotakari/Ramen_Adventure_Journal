class Review < ApplicationRecord
  belongs_to :user
  has_one_attached :ramen_image

  validates :shop_name, presence: true
  validates :ramen_name, presence: true
  validates :review_comment, presence: true, length: { maximum: 500 }
  validates :all_rating, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

  def get_image
    unless ramen_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    ramen_image
  end
end
