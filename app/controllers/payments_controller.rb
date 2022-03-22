class PaymentsController < ApplicationController
    def index
    end 

    def create
       payment = Payment.where(:user_id=>params[:payment][:user],:item_id=>params[:payment][:item]).last
       if not (payment.nil?) and not payment.success
          flash[:alert] = "Success. Payment already accepted"
          redirect_to item_path(params[:payment][:item])
       else
       payment = Payment.new(payment_params)
       payment.user = User.find(params[:payment][:user])
       payment.item = Item.find(params[:payment][:item])

       gate = CoingateMerchant.new 
       order = gate.create_order(order_id="ORDER-#{Proc.new{n=Random.new; n.rand}.call}",
        price_amount=payment.item.count,user=current_user.id,description=payment.item.name,price_currency='USD')

       if not (order.status.nil?) and order.status == "paid" or order.status == "new"  
        redirect_to coingate_path(:url=>order.payment_url)
       else 
        flash[:alert] = "Error. Payment not accepted"
        redirect_to item_path(params[:payment][:item])
       end
      end
    end

    def coingate
        @url = params[:url]
    end

    private
    def payment_params
      payment = params.require(:payment).permit(:description)
    end
end
