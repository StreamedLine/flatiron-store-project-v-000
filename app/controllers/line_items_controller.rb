class LineItemsController < ApplicationController

	def create
		@cart = current_cart
		@cart.add_item(params[:item_id])
		redirect_to cart_path(@cart)
	end

	private

	# def line_item_params
	# 	params.require(:line_item).permit(:cart_id, :item_id, :quantity)
	# end

	def current_cart
		Cart.current_cart_for(current_user)
	end
end
