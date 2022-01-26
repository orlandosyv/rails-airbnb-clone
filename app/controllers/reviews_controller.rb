class ReviewsController < ApplicationController
  before_action :set_order, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product = @order.product

    if @review.save
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
