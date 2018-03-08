class AddTousers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :yser_of_experience, :string
    add_column :users, :language, :string
  end
end
