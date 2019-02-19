class Admins::UsersController < ApplicationController

   def show
   	   @user = User.find(params[:id])
   end

   def index
   	   @search = User.page(params[:page]).ransack(params[:q])
   	   @users = @search.result
   end

   def edit
       @user = User.find(params[:id])
   end

   def update
       @user = User.find(params[:id])
       @user.update(user_params)
       redirect_to admins_user_path
   end

   def destroy
       @user = User.with_deleted.find_by(params[:id])
   	   user = User.find(params[:id])
   	   user.destroy
   	   redirect_to admins_users_path
   end


   private
    def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :phone_number, :email_adress, :post_number, :prefectures, :city, :block, :password, :password_confirmation)
    end
end

