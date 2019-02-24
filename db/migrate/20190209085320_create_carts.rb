class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer  :user_id, foreign_key: true
      t.integer  :product_id, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
