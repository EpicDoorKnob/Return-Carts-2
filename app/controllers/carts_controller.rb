class CartsController < ApplicationController


    def index
        @carts = Cart.all
    end

    def show
    end

    def new
        @cart = Cart.new
    end

       def create
         @cart = Cart.new(cart_params)
        if @cart.save
            flash[:success] = "Let's load this cart!"
            redirect_to carts_cart_path
        else
            flash[:failure] = "Shit didn't work :("
            redirect_to carts_cart_path
        end
    end

     private

     def boop
         @user = User.first.email
    end

    def cart_params
        params.permit(:user_id, current_user, :muid)
    end


    
end
