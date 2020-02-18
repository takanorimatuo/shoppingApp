class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string   :name, null: false
      t.string   :size, null: false
      t.string   :brand, null: false
      t.string   :status, null: false
      t.integer  :price, null: false
      t.string   :date, null: false
      t.string   :text, null: false
      t.text     :image
      t.integer  :score, null: false
      t.integer  :send, null: false
      t.string   :burden, null: false
      t.integer  :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
