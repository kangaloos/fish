class Point < ApplicationRecord
  has_one_attached :image
  validates:title, presence: true
  validates:body, presence: true, length: { maximum: 200 }

  has_many :post_comments
  has_many :favorites, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["favorites", "image_attachment", "image_blob", "post_comments", "user"]
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  belongs_to :user
  def introduction
    # 紹介文を返す処理を書く
  end

end
