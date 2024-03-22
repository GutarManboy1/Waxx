class CreateWantedLists < ActiveRecord::Migration[7.1]
  def change
    create_table :wanted_lists do |t|

      t.timestamps
    end
  end
end
