class Icon < ApplicationRecord
  has_many :likes
  has_many :pictures, through: :likes
end
