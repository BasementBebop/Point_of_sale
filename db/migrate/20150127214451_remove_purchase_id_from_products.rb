class RemovePurchaseIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :purchase_id
  end
end
