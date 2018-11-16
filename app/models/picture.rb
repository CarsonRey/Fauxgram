class Picture < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :icons, through: :likes
  has_many :comments
  has_one_attached :img_url
  has_many :picture_hashtags
  has_many :hashtags, through: :picture_hashtags

end
