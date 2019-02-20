class Users::ProductsController < ApplicationController
   def top
   end

   def show
   	@product = Product.find(params[:id])
   	@cart = Cart.new
   end

   def index
   end

end
