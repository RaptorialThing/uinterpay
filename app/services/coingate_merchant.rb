class CoingateMerchant
   def initialize
    CoinGate.config do |config|
        config.auth_token  = 'qgN-5Rb-qu1wU29Ga8XDusW2Nsf51SQPWpGmzdiA'
        config.environment = 'sandbox' # live or sandbox. Default: live
    end
   end

   def get_payment
    order = CoinGate::Merchant::Order.find(1)
   end

   def create_order(:order_id=>"ORDER-#{Proc.new{n=Random.new; n.rand}.call}",
    :price_amount=>1050)

    post_params = {
        order_id:         :order_id,
        price_amount:     :price_amount,
        price_currency:   'USD',
        receive_currency: 'EUR',
        callback_url:     items_path,
        cancel_url:       root_path,
        success_url:      'https://example.com/account/orders',
        description:      'Apple Iphone 6'
      }
      
      order = CoinGate::Merchant::Order.create(post_params)
      
      if order
        # success
      else
        # order is not valid
      end
    end
   
end