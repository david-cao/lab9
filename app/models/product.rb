# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base

	has_and_belongs_to_many :orders
	has_many :orders_products

	scope :costs_less_than, -> (p){ where('price < ?', p).uniq.order(price: :asc) }

	scope :ordered_products, -> { joins(:orders) }

	#this works but what goes on during merge???
	#scope :has_pending_orders, -> { joins(:orders).merge(Order.ordered) }

	scope :has_pending_orders, -> { joins(:orders).where('orders.status =?', 'ordered').uniq.order(price: :asc) }

	scope :average_price, -> { average(:price) }
end
