class InvoicesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @invoice = @product.invoices.create(amount: @product.price)
  end

end
