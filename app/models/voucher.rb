require 'open-uri'

class Voucher < ApplicationRecord
  has_one_attached :photo
  belongs_to :restaurant
  after_create :image_from_google

  def image_from_google
    restaurant = self.restaurant
    google_file = URI.open(restaurant.google_photos(restaurant.google_place_id, 400).sample)
    self.photo.attach(io: google_file, filename: `#voucher_#{id}.png`, content_type: 'image/png')
    self.save
  end
end
