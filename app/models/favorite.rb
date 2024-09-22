class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  belongs_to :point
  
  validates :user_id, uniqueness: {scope: :post_image_id}
end
