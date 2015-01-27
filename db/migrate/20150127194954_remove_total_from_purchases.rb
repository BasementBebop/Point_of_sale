class RemoveTotalFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :total
  end
end
