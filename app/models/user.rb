class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable

  mount_uploader :image, ImageUploader

  has_many :blogs

  has_many :comments

  has_many :favorites, dependent: :destroy
end
