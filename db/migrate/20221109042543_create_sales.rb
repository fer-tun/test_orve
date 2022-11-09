class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.integer :client_id
      t.integer :seller_id
      t.integer :product_id
      t.string :number_product
      t.string :price_product
      t.string :total

      t.timestamps
    end
  end
end
