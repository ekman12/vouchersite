class Restaurant < ApplicationRecord
  has_many :vouchers
  geocoded_by :address
  # after_validation :geocode - DO THIS LATER WHEN HAVE GOOGLE SEARCH FOR MAPS
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :retrieve_additional_info
  # after_save :save_website


  def retrieve_additional_info
    geocoder_search = Geocoder.search(self.address).first
    if geocoder_search
      self.google_place_id = geocoder_search.data["place_id"]
    end

    # url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{self.google_place_id}&fields=website&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    # user_serialized = open(url).read
    # datas = JSON.parse(user_serialized)
    # self.website = datas["result"]["website"] unless datas["result"].nil?
    self.save
  end

end
