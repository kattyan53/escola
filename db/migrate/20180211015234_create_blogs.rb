class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :image
      t.string :name
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
