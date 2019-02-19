class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def update
		order = Order.find(params[:id])
		order.shipping_status = order_params[:shipping_status]
		order.save
		redirect_to admins_orders_path
	end

	private
	def order_params
		params.require(:order).permit(:shipping_status)
	end
end
