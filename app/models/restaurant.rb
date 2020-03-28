class Restaurant < ApplicationRecord
  has_many :vouchers

  # geocoded_by :address
  # after_validation :geocode - DO THIS LATER WHEN HAVE GOOGLE SEARCH FOR MAPS
end
