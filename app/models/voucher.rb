class Voucher < ApplicationRecord
  belongs_to :restaurant
  def get_restaurant
    Restaurant.find_by(id: self.restaurant_id)
  end
end
