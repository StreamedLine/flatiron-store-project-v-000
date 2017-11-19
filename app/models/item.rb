class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	has_many :carts, :through => :line_items

	def minus_from_inventory(amount_sold)
		self.update(inventory: (self.inventory - amount_sold))
	end

	def self.available_items
		where('inventory is not null and inventory > 0')
	end
end
