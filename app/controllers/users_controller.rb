class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
    end 
    

    def show
        paymentsSize = Payment.all.length
        payments = Payment.where(:user_id => current_user.id).last(10)
        payments.reject!{|payment| payment.item.nil?}
        if payments.length == Payment.all.length 
            @payments = payments
            return 
        else 
            stId = Payment.first.id
            ndId = stId + 10
            @payments = []
           while ((stId <= Payment.last.id) and (Payment.all.length != 0))
                payments = Payment.where(:user_id=>current_user.id,:id=>[*stId..ndId]).to_a 
                payments.reject!{|payment| payment.item.nil?} 
                payments.each {|e| @payments << e }
                stId += 10
                ndId += 10
           end
           return
        end
    end
end
