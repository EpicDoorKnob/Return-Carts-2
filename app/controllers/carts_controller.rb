class CartsController < ApplicationController
  def index
    @carts = Cart.all
    @your_carts = current_user.carts.all
    @muid_holder = current_user.email
    @cart_muid = current_user.carts.where(active: "true").first
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @has_active_cart = current_user.carts.where(active: "true").first
    if @has_active_cart.blank?
      @cart = current_user.carts.new(cart_params)
      @cart.active = "TRUE"
      @cart.muid = "N/A"
      @cart.size = 25
      @cart.save
      if @cart.save
        flash.keep[:success]="You created cart #{current_user.carts.where(active: "true").first.id}!"
        redirect_to new_tote_path  
      end
    else
      active_cart = current_user.carts.where(active: "true").first.id
      flash.keep[:danger]="Cart #{active_cart} must be finshed before starting a new cart"
      redirect_to new_tote_path
    end
  end

    def edit
      @current_cart_id = current_user.carts.where(active: "true").first
      @cart = Cart.where(id: @current_cart_id).first
      @cart.update_attributes(active: FALSE)
      @cart.save
      redirect_to carts_path
    end
    
  private

  def boop
    @user = User.first.email
  end

  def cart_params
    params.permit
  end
end
