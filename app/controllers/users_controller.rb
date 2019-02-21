class UsersController < ApplicationController
	before_action :authenticate_user!


	def new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to users_path

	end

	def create
		user = User.new(user_params)
		user.save
	end


	def show
		@user = User.find(current_user.id)
		@orders = Order.where(user_id: current_user.id)
	end

	def destroy
		user = User.find(params[:id])
		user = destroy
		redirect_to new_user_session_path
	end

    private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :phone_number, :email_adress, :post_number, :prefectures, :city, :block, :password, :password_confirmation)
	end
end
