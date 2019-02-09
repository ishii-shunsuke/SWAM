class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.date :birthday
      t.integer :gender
      t.string :phone_number
      t.string :email_address
      t.string :post_number
      t.integer :prefectures
      t.string :city
      t.text :block
      t.string :password
      t.string :password_confirmation
      t.boolean :deleted_at

      t.timestamps
    end
  end
end
