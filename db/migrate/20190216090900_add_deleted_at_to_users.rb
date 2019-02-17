class AddDeletedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted_at, :boolean
    add_index :users, :deleted_at
  end
end
