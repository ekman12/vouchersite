class RemovePhotoUrlsFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :photo_url, :string
  end
end
