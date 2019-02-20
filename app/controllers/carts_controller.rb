class CartsController < ApplicationController

 def index
 	 @user = User.find(current_user.id)
 	 @carts = Cart.where(user_id: current_user.id)
 end

 def update
 	 cart = Cart.find(params[:id])
 	 cart.update(cart_params)
 	 redirect_to carts_path
 end

 def create
 	@cart = Cart.new(cart_params)
 	@cart.user_id = current_user.id
 	@cart.save
 	redirect_to carts_path
 end

 def destroy
 	 cart = Cart.find(params[:id])
 	 cart.destroy
 	 redirect_to carts_path
 end

 private
	def cart_params
		params.require(:cart).permit(:number, :product_id)
	end
end