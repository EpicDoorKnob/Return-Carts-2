class CartsController < ApplicationController
  def index
    @carts = Cart.all
    @your_carts = current_user.carts.all
    @muid_holder = current_user.email
    @cart_muid = current_user.carts.where(active: "true").first
  end

  def show
    @current_cart = current_user.carts.where(active: "true").first
  end

  def new
    @cart = Cart.new
  end

  def create
    @has_active_cart = current_user.carts.where(active: "true").first
    if @has_active_cart.blank?
      @cart = current_user.carts.new(make_cart)
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
      @cart = current_user.carts.where(active: "true").first
      @cart.update_attributes(active: FALSE)
      redirect_to carts_path
    end

    def update
      @current_cart = current_user.carts.where(active: "true").first
      if @current_cart.update_attributes(cart_params)
        flash.keep[:success]="Your cart's size is now #{@current_cart.size}"
        redirect_to new_tote_path
      else
        redirect_to show_cart_path(@current_cart_id)
      end
    end


  private

  def boop
    @user = User.first.email
  end

  def cart_params
    params.require(:cart).permit(:size)
  end

  def make_cart
    params.permit
  end
end
