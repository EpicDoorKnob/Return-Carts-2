class CartsController < ApplicationController


    def index
        @carts = Cart.all
        @your_carts = current_user.carts.all
        @muid_holder = current_user.email
    end

    def show
    end

    def new
         @cart = Cart.new
    end

       def create
            has_active_cart = current_user.carts.where(active: "true").first
            if has_active_cart.blank?
            @cart = current_user.carts.new(cart_params)
            @cart.active = "TRUE"
            @cart.muid = "N/A"
            @cart.save
                if @cart.save
                    flash.keep[:notice]="Cart created with MUID #{@cart.muid}"
                    redirect_to new_tote_path  
                end
        else
            active_cart = current_user.carts.where(active: "true").first.id
            flash.keep[:notice]="Cart #{active_cart} must be finshed before starting a new cart"
            redirect_to new_tote_path
        end
    end

     private

     def boop
         @user = User.first.email
    end

    def cart_params
        params.permit
    end

end
