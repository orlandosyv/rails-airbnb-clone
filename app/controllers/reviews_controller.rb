class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
  end

  def create
  end
end
