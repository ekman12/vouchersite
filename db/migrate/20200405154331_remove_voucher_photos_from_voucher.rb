class RemoveVoucherPhotosFromVoucher < ActiveRecord::Migration[5.2]
  def change
    remove_column :vouchers, :voucher_photo, :string
  end
end
