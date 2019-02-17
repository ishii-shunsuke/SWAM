class ApplicationController < ActionController::Base
	def after_sign_in_before_cart_path_for(resource)
  		carts_path
	end

end