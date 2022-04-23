class ItemsController < ApplicationController
    before_action :authenticate_user!
    def index
        @items = Item.all.limit(10).reverse
    end

    def new
        @item = Item.new
    end

    def create
        @item = current_user.items.new(item_params)

        if @item.save
            redirect_to @item
        else 
            render :new
        end
        
    end

    def show 
       @item = Item.find(params[:id])
       @payment = Payment.new
    end

    def edit 
       @item = Item.find(params[:id])

       unless @item.user == current_user
         redirect_to @item
       end
    end 

    def update 
       @item = Item.find(params[:id])
       
       unless @item.user == current_user
         redirect_to @item
       end

       if @item.update(item_params)
          redirect_to @item 
       else 
          render :edit 
       end
    end
    
    def destroy
       item = Item.find(params[:id])

       if item.user == current_user
          item.destroy
          redirect_to root_path
       else 
         redirect_to item
       end
    end

    private
    def item_params
    params.require(:item).permit(:name,:count,:currency)
    end
end
