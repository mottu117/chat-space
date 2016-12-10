class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_users do |t|
      t.references :user, null: false
      t.references :group, null: false
      t.timestamps
    end
    add_index :groups_users, [:user_id, :created_at]
    add_index :groups_users, [:group_id, :created_at]
  end
end
