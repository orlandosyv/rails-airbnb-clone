class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def myproducts
    @products = Product.where(user_id: current_user.id)
    @orders = []
    @products.each do |product|
      if product.orders.present?
        @orders += product.orders
      end
    end
  end

  def terms
  end

  def refund
  end

end
