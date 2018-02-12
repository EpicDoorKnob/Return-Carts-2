class TotesController < ApplicationController
require 'json'
  def index
    @totes = Tote.all 
  end

    def create
        @tote = Tote.new(tote_params)
        @tote.cart_id = current_user.carts.where(active: "true").first.id
        @tote.save 
        flash[:success]="#{current_user.carts.where(active: "true").first.totes.last.product.sku} goes in position
                                        #{current_user.carts.where(active: "true").first.totes.last.position}"
        redirect_to new_tote_path
    end

    def new
        @tote = Tote.new
        @current_cart_id = current_user.carts.where(active: "true").first.id
        @current_totes = Tote.where(cart_id: @current_cart_id)
        @unique_skus = @current_totes.pluck(:position).uniq.count
       # @bean = Cart.where(id: @current_cart_id)
       # @bean.active = "false"
       # @bean.save
       # redirect_to carts_path
    end

    def show
    end


    private

    def tote_params
        # params.require(:tote).permit(:cart_id, :product_id, :position, :qty)
        params.require(:tote).permit(:product_id, :position, :qty)
    end

end
