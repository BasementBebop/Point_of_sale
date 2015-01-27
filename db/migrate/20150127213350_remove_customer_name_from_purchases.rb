class RemoveCustomerNameFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :customer_name

    add_column :purchases, :date, :date
  end
end
