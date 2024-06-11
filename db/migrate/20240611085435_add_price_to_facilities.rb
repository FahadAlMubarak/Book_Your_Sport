class AddPriceToFacilities < ActiveRecord::Migration[7.1]
  def change
    add_monetize :facilities, :deposit_price, currency: { present: false }
  end
end
