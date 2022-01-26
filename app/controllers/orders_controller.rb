class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
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
end
