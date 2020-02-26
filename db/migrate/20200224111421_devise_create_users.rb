class CreateShoppingapps < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :first_name, null: false
      t.string      :last_name, null: false
      t.string      :nickname, null: false
      t.string      :first_kana, null: false
      t.string      :last_name, null: false
      t.string      :password, null: false
      t.date        :birth_day, null: false
    end
  end
end