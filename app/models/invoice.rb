class Invoice < ActiveRecord::Base
  belongs_to :payment, class_name: 'Payment'
  has_many :invoice_notifications, class_name: 'InvoiceNotification', dependent: :destroy
  belongs_to :product

  validates :amount, presence: true

  # 'Success' code for different gateways.
  SUCCESS_STATES = {
    'paysto' => 'RES_PAID'
  }

  # Create InvoiceNotification with details.
  def notify(params, gateway)
    self.invoice_notifications.create(pay_data: info_by_gateway(params, gateway))
  end

  # Check whether the invoice is should be paid.
  def need_to_be_paid?(gateway, payment_status, amount)
    !paid? && (payment_status == SUCCESS_STATES[gateway.to_s]) && (self.amount.to_f == amount.to_f)
  end

  # Create Payment record.
  def create_payment(payment_method, gateway_code, real_amount = nil)
    self.payment = Payment.new(amount: self.amount,
                         real_amount: real_amount,
                        gateway_code: gateway_code,
              gateway_payment_method: payment_method)

    if self.payment.save
      self.paid_at = Time.zone.now
      self.save
    end
  end

  # Whether the invoice is paid.
  def paid?
    !!paid_at
  end

  private

  # Payment details string.
  # You could extend this method for another gateways.
  def info_by_gateway(_params, _gateway)
    _keys = case _gateway
            when :paysto
              ['PAYSTO_SUM', 'PAYSTO_INVOICE_ID', 'PAYSTO_SHOP_ID', 'PAYSTO_DESC', 'PAYSTO_TTL', 'PAYSTO_PAYMENT_ID', 'PAYSTO_REQUEST_MODE']
            else
              []
            end

    _keys.map do |_key|
      [_key, _params[_key.to_sym]].join(':')
    end.join(';')
  end

end
