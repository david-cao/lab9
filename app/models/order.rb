# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  status     :string(255)      default("ordered")
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base


	belongs_to :user
	has_and_belongs_to_many :products
	has_many :orders_products

	validates :status, :inclusion => {in: %w(ordered shipped paid)}

	scope :ordered, -> { where(status: 'ordered') }


	def total_cost
		self.products.sum(:price)
	end

end
