class CreateShops < ActiveRecord::Migration[7.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :image

      t.timestamps
    end
  end
end
