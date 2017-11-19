class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, :through => :line_items

	def add_item(item)
		li = self.line_items.find_by(item_id: item)
		if li 
			li.update(quantity: li.quantity+1) and return li
		else
			self.line_items.build(item_id: item)
		end
	end

	def total
		self.items.sum(:price)
	end

	def checkout
		self.line_items.each do |line_item|
			Item.find(line_item[:item_id]).minus_from_inventory(line_item[:quantity])
		end
		self.update(status: 'submitted', user_id: nil)
	end

	def self.current_cart_for(user)
		user.current_cart || user.carts.create
	end

end
