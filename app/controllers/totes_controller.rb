class TotesController < ApplicationController
require 'json'
  def index
    @totes = Tote.all 
  end

    def create
        @current_cart_id = current_user.carts.where(active: "true").first.id
        @upc = Product.find_by(upc: params[:product_upc])
        @tote = Tote.new(tote_params)
        @tote.product_id = @upc.id
        @tote.cart_id = current_user.carts.where(active: "true").first.id
        @tote.qty = Tote.where(cart_id: @current_cart_id).pluck(:product_id).count(Tote.where(cart_id: @current_cart_id).pluck(:product_id).last) + 1
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
    end

    def show
    end


    private

    def tote_params
        params.require(:tote).permit(:position, :qty)
    end

end
