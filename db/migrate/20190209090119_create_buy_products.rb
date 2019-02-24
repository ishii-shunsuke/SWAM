class CreateBuyProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :buy_title
      t.integer :buy_number
      t.integer :buy_price
      t.integer :product_id
      t.integer :order_id

      t.timestamps
    end
  end
end
