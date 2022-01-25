class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new
    @order.product = @product
    @order.user = current_user
    @order.save
    redirect_to orders_path
  end

  private

  # def order_params
  #   params.require(:order).permit(:user_id, :product_id)
  # end
end
