class CreatePaystoTables < ActiveRecord::Migration
  def change

    create_table :payments do |t|
      t.float    :amount,                    default: 0.0
      t.float    :real_amount
      t.string   :gateway_code
      t.string   :gateway_payment_method
      t.timestamps
    end

    create_table :invoices do |t|
      t.integer  :payment_id
      t.float    :amount,                    default: 0.0
      t.datetime :paid_at
      t.timestamps
    end
    add_index :invoices, :payment_id

    create_table :invoice_notifications do |t|
      t.integer  :invoice_id
      t.text     :pay_data
      t.timestamps
    end
    add_index :invoice_notifications, :invoice_id

  end
end
