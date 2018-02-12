class Blog < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Blog.joins(:user).where(["(title LIKE ?) OR (content LIKE ?) OR (content2 LIKE ?) OR (users.name LIKE ?)",
         "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Blog.all #全て表示。
    end
  end
end
