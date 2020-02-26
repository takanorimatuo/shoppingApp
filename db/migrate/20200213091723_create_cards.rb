class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer  :user_id, null: false, foreign_key: true
      t.integer  :card_number, null: false, foreign_key: true
      t.string   :code, null: false
      t.string   :date, null: false
      t.timestamps
    end
  end
end
