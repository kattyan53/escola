class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable

  mount_uploader :image, ImageUploader

  has_many :blogs

  has_many :comments
end
