class Purchase < ActiveRecord::Base
  has_and_belongs_to_many :products

  scope(:between, lambda do |start_date, end_date|
    where("date >= :start_date AND date <= :end_date",
      { :start_date => start_date, :end_date => end_date })
  end)


  define_method(:total) do
    total = 0
    self.products.each do |product|
      total += product.price # total = product.price.+(total) longhand
    end
    total
  end
end
