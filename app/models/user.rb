class User < ApplicationRecord

  has_many :reviews
  has_many :comments
  has_many :bookmarks

  has_secure_password

  validates :username, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:true

  # add the avatar uploader
  mount_uploader :avatar, AvatarUploader

  def to_param
    username
  end
end
