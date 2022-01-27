class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def myproducts
    @products = Product.where(user_id: current_user.id)
  end

  def terms
  end 

  def refund
  end

end
