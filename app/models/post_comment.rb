class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :point
  validates :comment, presence: true
end
