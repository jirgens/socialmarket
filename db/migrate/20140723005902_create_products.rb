class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :pic1, :pic2, :pic3, :pic4
      t.integer :price
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
