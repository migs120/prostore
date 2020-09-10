class OrderCheckout < ActiveRecord::Base
  belongs_to :order
  has_many :order_checkout_transactions, dependent: :destroy
  has_many :checkout_paid_items, dependent: :destroy
  attr_accessor :card_number, :card_verification
 # validate :validate_card, :on => :create
  
 
  
  def purchase(current_order, params)
    response = GATEWAY.purchase(
                                price_in_cents(current_order),
                                credit_card(params),
                                purchase_options(params)
                              )
    
    
    order_checkout_transactions.create!(:action => "purchase", :amount => price_in_cents(current_order), :response => response)
   # cart.update_attribute(:purchased_at, Time.now)  ## this needs to work but dont have a purchased_at attribute in any model
      if response.success?
    response.success?
      end
  end
  
  def price_in_cents(current_order)
    # (current_order.subtotal*100 + 400).round 
    (current_order.subtotal*100).round
  end

  private
  
  def purchase_options(params)
    {
      :ip => ip_address,
      :billing_address => {
        :name     => params[:order_checkout][:bill_name],
        :address1 => params[:order_checkout][:bill_adress],
        :city     => params[:order_checkout][:bill_city],
        :state    => params[:order_checkout][:bill_state],
        :country  => "US",
        :zip      => params[:order_checkout][:bill_zip]
      }
    }
  end

  
  def credit_card(params)
        logger.debug puts "
                      debbuger
                      \n #{  }
                    
                      " 
               # exit
     if Rails.env.production?
   
          @credit_card ||= ActiveMerchant::Billing::CreditCard.new(

                first_name: params[:order_checkout][:first_name],
                last_name:params[:order_checkout][:last_name],
                number: params[:order_checkout][:card_number],
                month: params[:order_checkout]["card_expires_on(2i)"],
                year:params[:order_checkout]["card_expires_on(1i)"],
                verification_value: params[:order_checkout][:card_verification]   )
       else
           @credit_card ||= ActiveMerchant::Billing::CreditCard.new(

                first_name: params[:order_checkout][:first_name],
                last_name:params[:order_checkout][:last_name],
                number: params[:order_checkout][:card_number] == '' ? ENV['PAYPAL_CARD_NUMBER'] : params[:order_checkout][:card_number],
                month: params[:order_checkout]["card_expires_on(2i)"],
                year:'2020',
                verification_value: '345'   )
     end
       
  end
  
  
  
  
  
  
end
