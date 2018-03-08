class PublicAcconut < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :official_account, :boolean
  end
end
