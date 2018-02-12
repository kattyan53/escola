class AddPostIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :post_id, :integer
    add_column :users, :introduce, :string
    add_column :users, :career, :string
    add_column :users, :scout, :integer
    add_column :users, :recommended, :integer
    add_column :users, :user_image, :string
  end
end
