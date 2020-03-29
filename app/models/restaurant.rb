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

    # STOP HERE
    # if geocoder_search
    # binding.pry
      place_id = geocoder_search.data["place_id"]
      self.google_place_id = place_id
    # end

    # url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    # user_serialized = open(url).read
    # datas = JSON.parse(user_serialized)
    # self.website = datas["result"]["website"] unless datas["result"].nil?
    # photo_reference = datas["result"]["photos"][0]["photo_reference"] unless datas["result"].nil?

    # photoUrl = "https://maps.googleapis.com/maps/api/place/photo?photoreference=#{photo_reference}&sensor=false&maxheight=1200&maxwidth=1200&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
# binding.pry
    self.save
    # binding.pry
  end

    # STOPHERE
end
