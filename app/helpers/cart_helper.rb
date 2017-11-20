module CartHelper
	def current_cart
		current_user.current_cart
	end
end