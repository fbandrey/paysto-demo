class PaystoController < ActionController::Base
  include Paysto::Controller

  def check
    invoice = Paysto.invoice_class.find_by_id(params['PAYSTO_INVOICE_ID'])
    puts "=======================> IP: #{request.remote_ip.inspect}"
    if Paysto.invoice_valid?(invoice) && Paysto.ip_valid?(request.remote_ip) && Paysto.md5_valid?(params)
      puts "====> Verification: true"
      render text: invoice.id
    else
      puts "====> Verification: false"
      render text: I18n.t('paysto.check.fail')
    end
  end

end