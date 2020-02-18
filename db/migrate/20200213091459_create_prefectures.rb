class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string   :city, null: false
      t.string   :address, null: false
      t.integer  :tel, null: false
      t.text     :image
      t.integer  :score, null: false
      t.timestamps
    end
  end
end
