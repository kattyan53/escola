class Nices < ActiveRecord::Migration[5.1]
  def change
    create_table :nices do |t|
      t.integer :user_id
      t.integer :blog_id
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
