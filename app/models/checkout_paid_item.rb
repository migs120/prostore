class CheckoutPaidItem < ActiveRecord::Base
  belongs_to :order_checkout
end
