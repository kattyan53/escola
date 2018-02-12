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
end
