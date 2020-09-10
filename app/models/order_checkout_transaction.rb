class OrderCheckoutTransaction < ActiveRecord::Base
  belongs_to :order_checkout
  serialize :params
  
  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end
  
#  def palretun(params)
 #   OrderCheckoutTransaction.create(amoutn: 7600)
 # end
  
  
end
