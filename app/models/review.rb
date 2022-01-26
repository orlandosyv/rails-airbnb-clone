class Review < ApplicationRecord
  belongs_to :product

  validates :content, presence: true, length: { minimum: 6 }
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
