class Product < ApplicationRecord
  has_one_attached :image
  validates :price, numericality: true
end
