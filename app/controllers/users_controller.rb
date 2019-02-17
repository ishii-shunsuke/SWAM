class UsersController < ApplicationController
	def new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	end

	def create
		user = User.new(user_params)
		user.save
	end


	def show
		@user = User.new
		#@user = User.find(current_user.id)
		#@cart = Cart.find(params[:id])
        @carts = Cart.all
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
