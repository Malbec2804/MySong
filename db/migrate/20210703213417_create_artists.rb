class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name, null: false, limit: 30
      t.text :biography, null: false

      t.timestamps
    end
  end
end
