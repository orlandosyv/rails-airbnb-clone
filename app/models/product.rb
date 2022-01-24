class Product < ApplicationRecord
  has_many :orders
  belongs_to :user

  CATEGORIES = %w[Polos Camisas Jeans]

  validates :name, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: CATEGORIES, message: "Categoria invalida" }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
