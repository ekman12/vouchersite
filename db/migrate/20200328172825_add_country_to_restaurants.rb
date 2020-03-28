class AddCountryToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :country, :string
  end
end
