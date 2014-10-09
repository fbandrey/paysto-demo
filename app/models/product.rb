class Product < ActiveRecord::Base
  has_many :invoices
  has_many :payments, through: :invoices
  validates :name, :image_url, :price, presence: true
end
