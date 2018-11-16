class Like < ApplicationRecord
  belongs_to :picture
  belongs_to :icon
  belongs_to :user
end
