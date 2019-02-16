class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!
	def top
	end

	def new
	end
end

