class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
    end 
    

    def show
        @payments = Payment.where(:user_id => current_user.id).last(10)
    end
end
