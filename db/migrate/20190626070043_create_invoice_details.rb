class CreateInvoiceDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_details do |t|
      t.references :invoice, foreign_key: true, index: true
      t.references :product, foreign_key: true, index: true
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
