class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited?(user)
    favorites.exists?(user_id: user.id)
  end
end
