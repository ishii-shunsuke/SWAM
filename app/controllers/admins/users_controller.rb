class Admins::UsersController < ApplicationController

   def show
   	   @user = User.find(params[:id])
       @orders = Order.all
   end

   def index
   	   @search = User.page(params[:page]).ransack(params[:q])
   	   @users = @search.result
   end

   def edit
       @user = User.find(params[:id])
   end

   def update
       user = User.find(params[:id])
       user.update(user_params)
       logger.debug user.errors.inspect
       redirect_to admins_user_path
   end

   def destroy
       user = User.with_deleted.find_by(params[:id])
   	   user = User.find(params[:id])
   	   user.destroy
   	   redirect_to admins_users_path
   end


   private
   def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :phone_number, :email, :post_number, :prefectures, :city, :block, :password, :password_confirmation)
   end

   private
   def order_params
    params.require(:order).permit(:shipping_status)
   end

   protected

   def update_resource(resource, params)
    resource.update_without_current_password(params)
   end

 end

