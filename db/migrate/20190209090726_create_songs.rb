class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.integer :song_number
      t.integer :disc_id

      t.timestamps
    end
  end
end
