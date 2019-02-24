class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :shipping_status, default: 1
      t.integer :user_id
      t.string :shipping_name
      t.string :shipping_post_number
      t.text :shipping_address

      t.timestamps
    end
  end
end
