class Users::OrdersController < ApplicationController
	def set_address
		@shipping_addresses = ShippingAddress.all
	end

	def new
		@order = Order.new
		@carts = Cart.all
		@shipping_address = ShippingAddress.find(params[:shipping_address_id])
	end

	def show
	end
end
