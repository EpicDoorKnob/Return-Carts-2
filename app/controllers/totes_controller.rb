class TotesController < ApplicationController
require 'json'

def index
@totes = Tote.all 
end

def create
  @current_totes = Tote.where(cart_id: @current_cart_id)
  @current_cart_id = current_user.carts.where(active: "true").first.id
  @upc = Product.find_by(upc: params[:product_upc])
  @tote = Tote.new(tote_params)
  @tote.product_id = @upc.id
  if @upc.id.present?
    @tote.cart_id = current_user.carts.where(active: "true").first.id
    @tote.qty = Tote.where(cart_id: @current_cart_id).pluck(:product_id).count(@tote.product_id) + 1
      if Tote.where(cart_id: @current_cart_id).pluck(:product_id).include?(@upc.id)
        @tote.position = Tote.where(cart_id: @current_cart_id).where(product_id: @upc.id).first.position
      else
        if Tote.where(cart_id: @current_cart_id).blank?
          @tote.position = 1
        else
          @tote.position = Tote.where(cart_id: @current_cart_id).pluck(:position).max.to_i + 1
        end
      end
        if @tote.position.to_i > current_user.carts.where(active: "true").first.size
          flash[:danger]="You cannot add any more product to this cart!"
          redirect_to new_tote_path and return
        end
        if @tote.save
          flash[:success]="Position #{current_user.carts.where(active: "true").first.totes.last.position}"
          redirect_to new_tote_path
        end
        else
      end
    else
    end
  
    def new
        @tote = Tote.new
        @current_cart_id = current_user.carts.where(active: "true").first.id
        @current_cart = current_user.carts.where(active: "true").first
        @current_totes = Tote.where(cart_id: @current_cart_id)
        @unique_skus = @current_totes.pluck(:position).uniq.count
    end

    def show
    end


    private

    def tote_params
        params.permit
    end

end
