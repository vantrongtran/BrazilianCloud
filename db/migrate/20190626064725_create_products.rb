class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.decimal :price, precision: 10, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
