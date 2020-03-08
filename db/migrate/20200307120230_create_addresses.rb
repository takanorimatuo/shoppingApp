class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_number, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :tel
      t.integer :user_id, null: false, foreign_key: true
      t.integer :prefecture_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
