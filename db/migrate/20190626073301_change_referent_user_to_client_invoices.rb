class ChangeReferentUserToClientInvoices < ActiveRecord::Migration[5.2]
  def change
    rename_column :invoices, :user_id, :client_id
  end
end
