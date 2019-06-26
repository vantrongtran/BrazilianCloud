class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email, index: true
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
