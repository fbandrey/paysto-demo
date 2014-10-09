class AddProductIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :product_id, :integer
    add_index  :invoices, :product_id
  end
end
