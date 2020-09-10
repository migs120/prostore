require 'rubygems'
require 'active_merchant'

# Use the TrustCommerce test servers
ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
            :login => 'migs432-facilitator_api1.yahoo.com',
            :password => '9PJ6MNHQ3PBVKAF6',
            :signature => 'An5ns1Kso7MWUdW4ErQKJJJ4qi4-A8PdR2IyPOHBXahOWws4TsJXKyQG'
  
  
  )

# ActiveMerchant accepts all amounts as Integer values in cents
amount = 1000  # $10.00

# The card verification value is also known as CVV2, CVC2, or CID
credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => 'Bob',
                :last_name          => 'Bobsen',
                :number             => '4032039537963375',
                :month              => '9',
                :year               => '2020',
                #:year               => '1890',
                :verification_value => '321')

# Validating the card automatically detects the card type
if credit_card.valid?
  # Capture $10 from the credit card
  response = gateway.purchase(amount, credit_card, :ip => 'https://ruby-on-rails-122217.nitrousapp.com/main_categories')

  if response.success?
    puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
  else
    raise StandardError, response.message
    
  end
  
  else
  puts "card is not valid. #{credit_card.errors.full_messages}"
end