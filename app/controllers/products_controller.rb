class ProductsController < ApplicationController
  def index
    if params[:search][:query].present?
      @products = Product.where("name iLIKE ? OR category iLIKE ?", "%#{params[:search][:query]}%", "%#{params[:search][:query]}%" )
    
    else
      @products = Product.all
      
    end  
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
