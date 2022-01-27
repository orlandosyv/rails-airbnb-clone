class Product < ApplicationRecord
  has_many :orders
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
  # crear un imput campo en la vista del form
  # en show: Product.photo (@product.photo)
  # <%= cl_image_tag @product.photo.key, alt: "Logo", style:"height:80px", class:"" %>

  CATEGORIES = %w[Polos Poleras Camisas Jeans Vestidos Shorts Pijamas Gorros Casacas Chompas]

  validates :name, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: CATEGORIES, message: "Categoria invalida" }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :photo, presence: true
end
