class CreateShoppingapps < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :name, null: false
      t.string      :nickname, null: false
      t.string      :email, null: false
      t.string      :password, null: false
      t.integer     :address_number
      t.string      :prefectures
      t.string      :city, null: false
      t.string      :address, null: false
    end
  end
end
