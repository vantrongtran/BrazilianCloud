class UpdateIndexForeignKeyInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :invoices, column: :client_id
  end
end
