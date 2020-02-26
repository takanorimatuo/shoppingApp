class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string     :src, null: false
      t.integer    :product_id, null: false, foregin_key: true
      t.timestamps
    end
  end
end
