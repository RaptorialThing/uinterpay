class PaymentsController < ApplicationController
    def index
    end 

    def create
       payment = Payment.where(:user_id=>params[:payment][:user],:item_id=>params[:payment][:item])
       if not payment.empty?
          flash[:alert] = "Success. Payment already accepted"
          redirect_to item_path(params[:payment][:item])
       else
       payment = Payment.new(payment_params)
       payment.user = User.find(params[:payment][:user])
       payment.item = Item.find(params[:payment][:item])
       payment.success = true

       if payment.save
          flash[:alert] = "Success. Payment accepted"
       else 
          flash[:alert] = "Error. Payment not accepted"
       end

       redirect_to item_path(params[:payment][:item])
       end
    end

    private
    def payment_params
      payment = params.require(:payment).permit(:description)
    end
end
