class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :shipping_status
      t.integer :user_id
      t.string :shipping_name
      t.string :shipping_post_number
      t.text :shipping_address

      t.timestamps
    end
  end
end
