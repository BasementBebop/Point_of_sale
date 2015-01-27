class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :total
      t.integer :product_id


      t.timestamps
    end
  end
end
