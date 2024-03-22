class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.string :artist_name
      t.string :album_name
      t.string :genre

      t.timestamps
    end
  end
end
