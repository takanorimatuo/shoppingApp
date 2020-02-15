class CreateShoppingapps < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :name
      t.string      :nicname
      t.string      :email
      t.string      :password
      t.integer     :address_number
      t.string      :prefectures
      t.string      :city
      t.string      :address
      t.integer     :tel
      t.text        :image
      t.string|     :score
      t.timestamps null: true
      t.timestamps
    end
  end
end
