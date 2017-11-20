class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, :through => :line_items

	def add_item(item)
		li = self.line_items.detect{|line_item| line_item.item_id == item.to_i }
		if li 
			li.update(quantity: li.quantity + 1) and return li
		else
			self.line_items.build(item_id: item)
		end
	end

	def total
		self.items.sum(:price)
	end

	def checkout
		self.line_items.each do |line_item|
			line_item.item.minus_from_inventory(line_item[:quantity])
		end
		self.update(status: 'submitted', user_id: nil)
	end

end
