class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :point
  
  validates :user_id, uniqueness: {scope: :point_id}
end
