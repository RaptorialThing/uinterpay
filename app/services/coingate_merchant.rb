class CoingateMerchant
   def initialize
    CoinGate.config do |config|
        config.auth_token  = 'secret'
        config.environment = 'sandbox' # live or sandbox. Default: live
    end
   end

   def get_payment(id)
    order = CoinGate::Merchant::Order.find(id)
   end

   def create_order(order_id="ORDER-#{Proc.new{n=Random.new; n.rand}.call}",
    price_amount=1050,user=1,description="Чай",price_currency='USD')

    post_params = {
        order_id:         order_id,
        price_amount:     price_amount,
        price_currency:   price_currency,
        receive_currency: 'EUR',
        callback_url:     "heroku",
        cancel_url:       "heroku/items",
        success_url:      "heroku/user/#{user}",
        description:      description
      }
      
      order = CoinGate::Merchant::Order.create(post_params)
      
      if order
        
      else
        if order.nil?
        order = "error"
        end
      end
      order
    end

    def verify_payment(id,payment)
    
        order = get_payment(id)

        if order
           if order.status == "paid"
           payment = Payment.find(payment)
           payment.status = true 
           payment.description = order.to_json
           order = "success"
           else
            payment = Payment.find(payment)
            payment.status = false 
            payment.description = order.to_json
            order = "wait payment"
           end
        else 
            order = "error"
        end
        payment.save
       order
    end

end