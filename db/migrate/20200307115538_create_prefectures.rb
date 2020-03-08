class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.integer :prefecture_id, null: false
      t.integer :user_id, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
