require 'bcrypt'
class User < ApplicationRecord
  validates_confirmation_of :password
  has_many :follower_follows, class_name: "Following", foreign_key: :followee_id
  has_many :followers, through: :follower_follows, source: :follower
  has_many :followee_follows, class_name: "Following", foreign_key: :follower_id
  has_many :followees, through: :followee_follows, source: :followee
  has_many :likes
  has_many :pictures
  has_many :comments, through: :pictures
  # has_many :hashtags
   has_secure_password
   has_one_attached :img_url

  # def password=(plaintext_password)
  #   self.password_digest = BCrypt::Password.create(plaintext_password)
  # end

  def authenticate(plaintext_password)
    BCrypt::Password.new(self.password_digest) == plaintext_password
  end

  def add_like

  end

  def post_picture

  end

  def set_img_url
    self.img_url.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'snowflake.png')), filename: 'snowflake.png', content_type: 'image/png')
  end


end
