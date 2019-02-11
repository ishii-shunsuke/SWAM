class Users::OrdersController < ApplicationController
	def set_address
		@shipping_addresses = ShippingAddress.all
	end

	def new
		@carts = Cart.all
		@shipping_address = ShippingAddress.find(params[:shipping_address_id])
		session[:shipping_address_id] = params[:shipping_address_id]
	end

	def create
		shipping_address_id = session[:shipping_address_id]
		shipping_address = ShippingAddress.find(shipping_address_id)
		#Order作成
		order = Order.new
		order.shipping_name = shipping_address.last_name + shipping_address.first_name
		order.shipping_post_number = shipping_address.post_number
		order.shipping_address = "#{shipping_address.prefectures}" + "#{shipping_address.city}" + "#{shipping_address.block}"
		order.save
		#BuyProducts作成
 		carts = Cart.all
		@carts.each do |cart|
			buy_product = BuyProducts.new
			buy_product.product_id = cart.product_id
			buy_product.buy_title = cart.product.title
			buy_product.buy_price = cart.product.price
			buy_product.buy_number = cart.number
			buy_product.order_id = order.id
			buy_prodcut.save
		end
	end

	def show
	end
end
