require "spec_helper"

describe(Purchase) do
  it "returns the products for the purchase" do
    purchase = Purchase.create({:customer_name => "Sampson"})
    product1 = Product.create({:name => "Apples", :price => 0.50, :purchase_id => purchase.id})
    expect(purchase.products).to eq([product1])
  end
end
