class AddAddNickNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    change_column :users, :nickname, :string, null: false
  end
end
