require "spec_helper"

describe(Product) do
  it "returns the purchase for the product" do
    purchase = Purchase.create({:customer_name => "Sampson"})
    product = Product.create({:name => "Apples", :price => 1.00, :purchase_id => purchase.id})
    expect(product.purchase).to eq(purchase)
  end
end
