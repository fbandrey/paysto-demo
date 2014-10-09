class Payment < ActiveRecord::Base
  has_one :invoice, class_name: 'Invoice', dependent: :destroy

  validates :amount, presence: true
  validates :amount, exclusion: { in: [0] }, allow_nil: false
end