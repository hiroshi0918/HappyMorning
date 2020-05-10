class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :image

      t.timestamps
    end
  end
end
