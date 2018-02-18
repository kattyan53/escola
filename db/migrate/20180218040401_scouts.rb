class Scouts < ActiveRecord::Migration[5.1]
  def change
    create_table :scouts do |t|
      t.integer :scouter_user
      t.integer :scouted_user
      t.string :content
      t.string :title
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
