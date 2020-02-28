class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures(active_hash) do |t|
      t.string   :prefecture_name, null: false
      t.string   :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
