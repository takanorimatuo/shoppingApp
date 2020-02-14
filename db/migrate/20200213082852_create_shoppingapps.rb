class CreateShoppingapps < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :name
      t.string      :nicname
      t.string      :email
      t.timestamps null: true

      t.timestamps
    end
  end
end
