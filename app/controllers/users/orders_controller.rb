class Users::OrdersController < ApplicationController
	include ApplicationHelper
	before_action :authenticate_user!

	def set_address
		@shipping_addresses = ShippingAddress.where(user_id: current_user.id)
	end

	def new
		@carts = Cart.where(user_id: current_user.id)
		#アカウントの登録住所を配送先にする場合
		if params[:shipping_address_id] == "0"
			@shipping_address = ShippingAddress.new
			@shipping_address.last_name = current_user.last_name
			@shipping_address.first_name = current_user.first_name
			@shipping_address.post_number = current_user.post_number
			@shipping_address.prefectures = current_user.prefectures
			@shipping_address.city = current_user.city
			@shipping_address.block = current_user.block
		else
			#url直打ちを弾く
			shipping_addresses = ShippingAddress.where(user_id: current_user.id)
			shipping_ids = []
			shipping_addresses.each do |f|
				shipping_ids.push(f.id)
			end
			if shipping_ids.include?(params[:shipping_address_id].to_i)
				@shipping_address = ShippingAddress.find(params[:shipping_address_id])
			else
				render body: "forbidden"
			end
		end
		session[:shipping_address_id] = params[:shipping_address_id]
	end

	def create
		#アカウントの登録住所を配送先にする場合
		shipping_address_id = session[:shipping_address_id]
		if shipping_address_id == "0"
			shipping_address = ShippingAddress.new
			shipping_address.last_name = current_user.last_name
			shipping_address.first_name = current_user.first_name
			shipping_address.post_number = current_user.post_number
			shipping_address.prefectures = current_user.prefectures
			shipping_address.city = current_user.city
			shipping_address.block = current_user.block
		else
			shipping_address = ShippingAddress.find(shipping_address_id)
		end

		#Order作成
		order = Order.new
		order.shipping_name = full_name(shipping_address)
		order.shipping_post_number = shipping_address.post_number
		order.shipping_address = full_address(shipping_address)
		order.user_id = current_user.id
		order.save

		#BuyProducts作成
 		carts = Cart.where(user_id: current_user.id)
		carts.each do |cart|
			buy_product = BuyProduct.new
			buy_product.product_id = cart.product_id
			buy_product.buy_title = cart.product.title
			buy_product.buy_price = cart.product.price
			buy_product.buy_number = cart.number
			buy_product.order_id = order.id
			buy_product.save

			#在庫減らす
			product = cart.product
			product.stock -= cart.number
			product.save
		end
		redirect_to order_complete_path
	end

	def show
	end
end
