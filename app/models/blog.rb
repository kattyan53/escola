class Blog < ApplicationRecord
  belongs_to :user

  has_many :comments

  mount_uploader :image, ImageUploader

  validates :title,    length: { minimum: 1 }       # 「1文字以上」
  validates :title,    length: { maximum: 75 }      # 「75文字以下」
  validates :title,    length: { in: 1..75 }        # 「1文字以上75文字以下」
end
