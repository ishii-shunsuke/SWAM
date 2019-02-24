class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :disc_number
      t.integer :product_id

      t.timestamps
    end
  end
end
