class CreateOfficialAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :official_accounts do |t|
      t.string :title
      t.text :content_top
      t.text :content_middle
      t.text :content_bottom
      t.integer :user_id
      t.string :image_top
      t.string :image_left
      t.string :image_right
      t.string :image_bottom
      t.boolean :admin
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
