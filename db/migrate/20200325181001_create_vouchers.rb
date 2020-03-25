class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|
      # t.belongs_to :restaurant
      t.string :name
      t.decimal :price
      t.string :notes

      t.timestamps
    end
  end
end
