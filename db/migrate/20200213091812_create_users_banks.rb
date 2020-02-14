class CreateUsersBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :users_banks do |t|

      t.timestamps
    end
  end
end
