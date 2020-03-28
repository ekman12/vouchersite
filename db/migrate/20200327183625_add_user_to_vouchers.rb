class AddUserToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_reference :vouchers, :user, foreign_key: true
  end
end
