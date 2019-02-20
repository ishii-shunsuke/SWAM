class Users::ProductsController < ApplicationController
   def top
   end

   def show
   end

   def index
   	   	@products = Product.where(period: "1980年代")
   end

end
