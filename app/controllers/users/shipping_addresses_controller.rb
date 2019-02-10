class Users::ShippingAddressesController < ApplicationController
	def new
		@shipping_address = ShippingAddress.new
	end

	def create
		shipping_address = ShippingAddress.new(shipping_address_params)
		shipping_address.save
		redirect_to users_shipping_addresses_path
	end

	def index
	end

	def edit
	end

	def update
	end

	private
	def shipping_address_params
		params.require(:shipping_address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_number, :prefectures, :city, :block, :phone_number)
	end
end
