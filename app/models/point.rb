class Point < ApplicationRecord
   has_one_attached :image
   validates:title, presence: true
   validates:body, presence: true, length: { maximum: 200 }
    
   
   
  belongs_to :user
  def introduction
    # 紹介文を返す処理を書く
  end

end
