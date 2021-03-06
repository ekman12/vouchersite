class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :city
      t.string :neighbourhood
      t.string :address
      t.string :website

      t.timestamps
    end

    # create_table :vouchers do |t|
    #   t.belongs_to :restaurant
    #   t.string :name
    #   t.decimal :price
    #   t.string :notes

    #   t.timestamps
    # end

  end
end
