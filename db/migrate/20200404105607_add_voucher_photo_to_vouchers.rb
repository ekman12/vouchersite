class AddVoucherPhotoToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_column :vouchers, :voucher_photo, :string
  end
end
