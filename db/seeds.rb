require 'faker'

Product.destroy_all
Category.destroy_all
OrderStatus.destroy_all

Category.create(name: "Health & Beauty")
Category.create(name: "Clothes")
Category.create(name: "Toys")

OrderStatus.create(id: 1, name: "In Progress")
OrderStatus.create(id: 2, name: "Placed")
OrderStatus.create(id: 3, name: "Shipped")
OrderStatus.create(id: 4, name: "Cancelled")

10.times do
  Product.create(title: Faker::Commerce.product_name,
                 description: Faker::Lorem.sentence(10),
                 price: Faker::Number.decimal(2),
                 quantity: rand(1..50),
                 picture: Faker::Avatar.image,
                 active: true)
end

Product.all.each do |product|
  product.categories << Category.all.sample
end
