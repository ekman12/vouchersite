json.extract! voucher, :id, :name, :price, :notes, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)
