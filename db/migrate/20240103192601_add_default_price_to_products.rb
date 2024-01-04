class AddDefaultPriceToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :price, 0.0
  end
end
