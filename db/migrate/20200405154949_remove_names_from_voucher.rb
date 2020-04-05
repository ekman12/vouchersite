class RemoveNamesFromVoucher < ActiveRecord::Migration[5.2]
  def change
    remove_column :vouchers, :name, :string
  end
end
