class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false, limit: 30
      t.integer :duration, null: false
      t.string :genre, null: false
      t.integer :streams, null: false, default: 0

      t.timestamps
    end
  end
end
