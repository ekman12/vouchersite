class AddGooglePlaceIdToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :google_place_id, :integer
  end
end
