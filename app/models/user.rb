class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthabl
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  has_many :points, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :memberships
  has_many :groups, through: :memberships
  has_one_attached :profile_image

  def get_profile_image
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [100, 100]).processed
  end

end

  #def admin?
  #  self.admin
  #end

  #enum role: { general: 0, admin: 1 }

