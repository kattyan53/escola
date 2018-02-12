class AddContent2Users < ActiveRecord::Migration[5.1]
  def change
      add_column :blogs, :content2, :string
  end
end
