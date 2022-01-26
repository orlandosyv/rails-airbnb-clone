class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def new
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.product = @product
    @order.user = current_user
    @order.reviewed = false
    if @order.save
      redirect_to orders_path
      @product.stock -= 1
      @product.save
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :pay_method)
  end
end
