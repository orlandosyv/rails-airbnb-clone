class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_product, only: %i[edit update show]

  def index
    if params[:search].present?
      if params[:search][:query].empty?
        @products = Product.all.where("user_id != ?", current_user.id.to_s)
      else
        sql_query = " \
          name iLIKE :query AND user_id <> :user_id \
          OR category iLIKE :query AND user_id <> :user_id \
          OR description iLIKE :query AND user_id <> :user_id \
        "
        @products = Product.where(sql_query, query: "%#{params[:search][:query]}%", user_id: current_user.id.to_s)
      end
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, :stock, :photo)
  end
end
