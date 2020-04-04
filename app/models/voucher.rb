class Voucher < ApplicationRecord
  belongs_to :restaurant
  after_create :image_from_google

  def image_from_google
    restaurant = self.restaurant
    self.voucher_photo = restaurant.google_photos(restaurant.google_place_id, 400).sample
    self.save
  end
end
