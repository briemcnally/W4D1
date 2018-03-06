class CreateArtworkShares < ActiveRecord::Migration[5.1]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id
      t.integer :view_id
      t.timestamps
      t.index :artwork_id
      t.index :view_id
    end


  end
end
