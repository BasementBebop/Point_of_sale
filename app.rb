require "sinatra/activerecord"
require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "./lib/product"
require "./lib/purchase"

get '/' do
  @products = Product.all()
  @purchases = Purchase.all
  erb :index
end

post '/products' do
  name = params.fetch('name')
  price = params.fetch('price')
  @product = Product.create({:name => name, :price => price})
  redirect "/"
end

get '/products/:id' do
  @product = Product.find(params.fetch('id').to_i)
  erb :product
end

get '/purchases/:id' do
  @purchase = Purchase.find(params.fetch('id').to_i)
  @products = Product.all
  erb :purchase
end

patch "/products/:id" do
  name = params.fetch("name")
  price = params.fetch("price")
  @product = Product.find(params.fetch("id").to_i)
  @product.update({:name => name, :price => price})
  erb :product
end

delete "/products/:id" do
  @product = Product.find(params.fetch("id").to_i)
  @product.destroy
  @products = Product.all
  erb :index
end

post "/purchases" do
  date = params.fetch('date')
  @purchase = Purchase.create({:date => date})
  redirect "/"
end

patch "/purchases/:id" do
  @purchase = Purchase.find(params.fetch("id").to_i)
  product_ids = params.fetch("product_ids")
  @purchase.update({:product_ids => product_ids})
  @products = Product.all
  erb(:purchase)
end
