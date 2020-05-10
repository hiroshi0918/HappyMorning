class AddReferencesToFoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :foods, :shop, foreign_key: true
  end
end
