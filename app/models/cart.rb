class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user_id
end
