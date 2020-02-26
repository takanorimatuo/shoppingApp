class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.integer :user_id, foreign_key: true
      t.string  :bank_name, null: false, foreign_key: true
      t.string  :branch, null: false
      t.integer :number, null: false
      t.timestamps
    end
  end
end
