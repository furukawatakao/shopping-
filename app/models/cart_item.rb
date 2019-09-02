class CartItem < ApplicationRecord
  has_many :products
  belongs_to :cart
  belongs_to :user
end
