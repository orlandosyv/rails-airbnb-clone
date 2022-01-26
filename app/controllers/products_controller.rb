class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_product, only: %i[edit update show]

  def index
    if params[:search].present?
      if params[:search][:query].empty?
        @products = Product.all
      else
        @products = Product.where("name iLIKE ? OR category iLIKE ?", "%#{params[:search][:query]}%", "%#{params[:search][:query]}%" )
      end
    else
      @products = Product.where(user_id: current_user.id)
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
    @product = Product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, :stock)
  end
end
