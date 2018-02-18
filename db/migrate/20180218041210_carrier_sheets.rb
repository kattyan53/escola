class CarrierSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :carrier_sheets do |t|
      t.integer :user_id
      t.text :motivation
      t.text :strength
      t.text :experience
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
