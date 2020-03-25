class AddRestaurantToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_reference :vouchers, :restaurant, foreign_key: true
  end
end
