class InvoiceNotification < ActiveRecord::Base
  belongs_to :invoice, class_name: 'Invoice'
end