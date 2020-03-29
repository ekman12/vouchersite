class ChangeGooglePlaceIdToBeStringInRestaurants < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :google_place_id, :string
  end
end
