class Blog < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Blog.where(['content LIKE ?', "%#{search}%"])
    else
      Blog.all #全て表示。
    end
  end
end
