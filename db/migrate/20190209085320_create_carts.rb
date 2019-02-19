class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references  :user,  index: true, foreign_key: true
      t.references  :product, index: true, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
