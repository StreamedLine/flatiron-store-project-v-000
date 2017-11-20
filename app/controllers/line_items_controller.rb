class LineItemsController < ApplicationController
	def create
		@cart = init_current_cart?
		@cart.add_item(params[:item_id])
		@cart.save

		redirect_to cart_path(@cart)
	end

	private

	def init_current_cart?
		if !current_user.current_cart 
			Cart.create(user_id: current_user.id)
		else
			current_user.current_cart
		end
	end
end
