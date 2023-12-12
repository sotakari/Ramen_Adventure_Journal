class Review < ApplicationRecord
  belongs_to :user
  has_one_attached :ramen_image

  validates :shop_name, presence: true
  validates :ramen_name, presence: true
  validates :review_comment, presence: true, length: { maximum: 500 }

  def get_image
    unless ramen_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    ramen_image
  end
end
