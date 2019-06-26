class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.references :user, foreign_key: true, index: true
      t.decimal :total, precision: 30, scale: 2
      t.integer :status, default: 0, limit: 1

      t.timestamps
    end
  end
end
