class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.text :group_name, NULL: false
      t.timestamps NULL: false
    end
  end
end
