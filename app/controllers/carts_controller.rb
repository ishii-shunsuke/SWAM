class CartsController < ApplicationController

before_action :authenticate_user!, except: [:create]

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
 	@product = Product.find(params[:cart][:product_id])
 	# p "-----------------"
 	# p @product
 	# p @product.id
 	#p "-----------------"
	@cart = Cart.find_by(product_id: @product.id)
	#p "-----------------"
 	#p @cart
 	#p "-----------------"
 	if @cart.present?
 		# 重複する
 		@cart.number = @cart.number + params[:cart][:number].to_i
 		@cart.save
 		redirect_to carts_path
 	else
 		# 重複してない
 		@cart = Cart.new(cart_params)
	 	if current_user != nil
		 	@cart.user_id = current_user.id
		 	@cart.save
		 	redirect_to carts_path
	    else
	    	redirect_to "/cart/sign_in/#{params[:cart][:product_id]}/#{params[:cart][:number]}"
	    end
 	end

 end

 def destroy
 	 cart = Cart.find(params[:id])
 	 cart.delete
 	 redirect_to carts_path
 end

 private
	def cart_params
		params.require(:cart).permit(:number, :product_id)
	end
end