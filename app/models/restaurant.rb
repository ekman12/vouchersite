require 'json'
require 'open-uri'

class Restaurant < ApplicationRecord
  has_many :vouchers
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :retrieve_additional_info

  def retrieve_additional_info
    geocoder_search = Geocoder.search(self.address)
    if geocoder_search.kind_of?(Array)
      geocoder_search = geocoder_search.first
    end

    place_id = geocoder_search.data["place_id"]
    google_data_url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    google_data = JSON.parse(open(google_data_url).read)
    photo_reference = google_data["result"]["photos"][0]["photo_reference"] || ""
    google_photo_url = "https://maps.googleapis.com/maps/api/place/photo?photoreference=#{photo_reference}&sensor=false&maxheight=1200&maxwidth=1200&key=#{ENV['GOOGLE_API_SERVER_KEY']}"

    self.google_place_id = place_id
    self.website = google_data["result"]["website"] || ""
    self.photo_url = google_photo_url
    self.save
  end

  def tidy_address
    self.address.split(",")[1,5].join(",")
  end
end
