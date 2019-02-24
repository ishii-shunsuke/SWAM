class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.integer :artist_id
      t.string :jacket_image_id, null: false
      t.integer :price
      t.integer :label_id
      t.integer :category_id
      t.string :period
      t.integer :stock
      t.boolean :deleted_at

      t.timestamps
    end
  end
end
