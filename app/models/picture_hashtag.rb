class PictureHashtag < ApplicationRecord
  belongs_to :picture
  belongs_to :hashtag
end
