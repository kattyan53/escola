class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.text :content2
      t.integer :user_id
      t.string :image
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
