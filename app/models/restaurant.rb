require 'json'
require 'open-uri'

class Restaurant < ApplicationRecord
  has_one_attached :photo
  has_many :vouchers
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :retrieve_additional_info

  def retrieve_additional_info
    geocoder_search = Geocoder.search(self.address)
    geocoder_search = geocoder_search.first if geocoder_search.kind_of?(Array)

    place_id = geocoder_search.data["place_id"]
    google_data = google_data_scrape(place_id)
    self.google_place_id = place_id
    self.website = google_data["result"]["website"] || ""

    google_file = URI.open(google_photos(place_id, 1200)[0])
    self.photo.attach(io: google_file, filename: `#restaurant_#{id}.png`, content_type: 'image/png')
    save
  end

  def google_photos(place_id, size)
    photo_data = google_data_scrape(place_id)["result"]["photos"] || [{"photo_reference"=>"CmRaAAAATv-bQAsMow0UfgHyr96wEfEB6gkMAvaVQy8c61mNoyzIws24sWsdZXWWCiPOir7R434o5WrzEy73IBgqQqz2sGBJnRu_fKjl6uAVnflohAkvvLvdPD3t1wGsrUbbz9y1EhCdmNq5ks47G4vwRph_g-BVGhQXgiq_9Kg_JryKuquYQ12cakzCfQ"}]
    # Added a random photo data so it would work
    photo_data.map { |x| photo_reference_to_url(x["photo_reference"], size) }
  end

  def google_data_scrape(place_id)
    google_data_url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    JSON.parse(open(google_data_url).read)
  end

  def photo_reference_to_url(photo_reference, size)
    "https://maps.googleapis.com/maps/api/place/photo?photoreference=#{photo_reference}&sensor=false&maxheight=#{size}&maxwidth=#{size}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
  end

  def tidy_address
    address.split(",")[1, 5].join(",")
  end

  def plural_vouchers
    vouchers.count > 1 ? "s" : ""
  end
end
