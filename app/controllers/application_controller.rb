class ApplicationController < ActionController::Base
	# before_action :authenticate_user!, except: [:new, :create]

	def after_sign_in_before_cart_path_for(resource)
  		carts_path
	end

end