class Hashtag < ApplicationRecord
  has_many :picture_hashtags
  has_many :pictures, through: :picture_hashtags
end
