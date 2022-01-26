class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :review, through: :product

  validates :user_id, presence: true
  validates :product_id, presence: true
end
