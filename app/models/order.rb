class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :review, through: :product

  PAY_METHOD = ['Efectivo', 'Tarjeta de crédito', 'Tarjeta de débito', 'Transferencia']

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :pay_method, presence: true, inclusion: { in: PAY_METHOD, message: "Categoria invalida" }
  validates :address, presence: true, length: { minimum: 10 }
  validates :reviewed, presence: true
end
