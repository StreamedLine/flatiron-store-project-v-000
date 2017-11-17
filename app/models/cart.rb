class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, :through => :line_items

	def add_item(item)
		if current_user.current_cart
			LineItem.create(item_id: item, cart_id: current_user.current_cart.id)
		else
			current_user.update(current_cart: cart.create)
			LineItem.create(item_id: item, cart_id: current_user.current_cart.id)
		end
	end
end
