# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

me = User.create(name: 'David Cao', email: 'dcao@andover.edu')
products = %w(Book Pencil Notebook iPhone Pants)
prices = %w(9.99 0.99 2.99 299.99 49.99)

products.each_with_index do |p,index|
	Product.create(description:p, price:prices[index])
end

#user_id automatically associated with "me" user
me.orders.create(status:'ordered')
me.orders.first.products << Product.first
me.orders.first.products << Product.find(2)
me.orders.first.products << Product.last
