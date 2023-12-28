class CreateCategoryProductLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :category_product_links do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
