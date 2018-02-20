class TotesController < ApplicationController
  require 'json'
  
  def index
  @totes = Tote.all 
  end
  
  def show
      params[:id]
  end
  
  def create
    @current_totes = Tote.where(cart_id: @current_cart_id)
    @current_cart_id = current_user.carts.where(active: "true").first.id
    @upc = Product.find_by(upc: params[:product_upc])
    @tote = Tote.new(tote_params)
    @tote.product_id = @upc.id
    @tote.cart_id = current_user.carts.where(active: "true").first.id
    @tote.qty = Tote.where(cart_id: @current_cart_id).pluck(:product_id).count(@tote.product_id).to_i + 1
    if Tote.where(cart_id: @current_cart_id).where(product_id: Product.find_by(upc: params[:product_upc])).present?
      @tote.position = Tote.where(cart_id: @current_cart_id).where(product_id: Product.find_by(upc: params[:product_upc])).last.position
    else
      @tote.position = Tote.where(cart_id: @current_cart_id).pluck(:product_id).uniq.count + 1
    end
      if @tote.position.to_i > current_user.carts.where(active: "true").first.size
        flash[:danger]="You cannot add any more product to this cart!"
        redirect_to new_tote_path and return
      end
      if @tote.save
        flash[:success]="Position #{current_user.carts.where(active: "true").first.totes.last.position}"
        redirect_to new_tote_path
      end
  end
      def new
          @current_totes = Tote.where(cart_id: @current_cart_id)
          @already_tote = @current_totes.where(product_id: 2).count
          @tote = Tote.new
          @current_cart_id = current_user.carts.where(active: "true").first.id
          @current_cart = current_user.carts.where(active: "true").first
          @current_totes = Tote.where(cart_id: @current_cart_id)
          @unique_skus = @current_totes.pluck(:position).uniq.count
      end
  
      def show
        @current_cart_id = current_user.carts.where(active: "true").first.id
        @current_totes = Tote.where(cart_id: @current_cart_id)
      end
  
      def destroy
          @tote.destroy
          redirect_to new_tote_path
      end
  
      private
  
      def tote_params
          params.permit(:id)
      end
  
  end
  