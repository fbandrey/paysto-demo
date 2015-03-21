class ProductsController < ApplicationController

  def index
    @products = Product.order('created_at ASC')
    @payments = Payment.order('created_at DESC').limit(5)
  end

end
