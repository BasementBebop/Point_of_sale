require "sinatra/activerecord"
require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "./lib/product"

get '/' do
  @products = Product.all()
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
