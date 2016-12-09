class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.text :image_url
      t.references :user, null: false
      t.references :group, null: false
      t.timestamps
    end
    add_index :messages, [:user_id, :created_at]
    add_index :messages, [:group_id, :created_at]
  end
end
