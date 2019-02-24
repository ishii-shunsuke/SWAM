class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :post_number
      t.integer :prefectures
      t.string :city
      t.text :block
      t.string :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
