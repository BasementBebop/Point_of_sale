ENV['RACK_ENV'] = 'test'
require "rspec"
require "sinatra/activerecord"
require "product"

RSpec.configre do |config|
  config.after(:each) do |config|
    Product.all.each do |product|
      product.destroy
    end
  end
end
