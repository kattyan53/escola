class Blog < ApplicationRecord
  belongs_to :user

  has_many :comments

  mount_uploader :image, ImageUploader

  def self.search(search) #self.でクラスメソッド
    if search # searchがnilの場合は、titleカラムを部分一致検索
      Blog.joins(:user).where(["(title LIKE ?) OR (content LIKE ?) OR (content2 LIKE ?) OR (users.name LIKE ?)",
         "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Blog.all
    end
  end

  validates :title,    length: { minimum: 1 }       # 「1文字以上」
  validates :title,    length: { maximum: 75 }      # 「75文字以下」
  validates :title,    length: { in: 1..75 }        # 「1文字以上75文字以下」
end
