class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :duration
      t.string :genre
      t.integer :streams

      t.timestamps
    end
  end
end
