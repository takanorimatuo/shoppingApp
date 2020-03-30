class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string     :product_name,       null:false                         #商品名
      t.text       :text,               null:false                         #商品の説明
      t.integer    :category_id,        null:false                         #カテゴリー
      t.string     :brand                                                  #ブランド
      t.integer    :status_id,          null:false                         #商品の状態
      t.integer    :delivery_charge_id,  null:false                         #配送料の負担
      t.integer    :prefecture_id,      null:false                         #都道府県
      t.integer    :delivery_day_id,    null:false                         #配送までの日数
      t.integer    :price,              null:false                         #価格

      t.references :seller,       foreign_kye:{to_table: :users}
      t.references :buyer,        foreign_kye:{to_table: :users}

      t.timestamps
    end
  end
end
