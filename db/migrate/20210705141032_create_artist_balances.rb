class CreateArtistBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_balances do |t|
      t.references :artist, null: false, foreign_key: true
      t.float :balance, null: false

      t.timestamps
    end
  end
end
