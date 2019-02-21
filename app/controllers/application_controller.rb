class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller? #deviseコントローラが動いたら、configure_permitted_parametersを処理する。

	def after_sign_in_before_cart_path_for(resource)
  		carts_path
	end

  protected

  def configure_permitted_parameters #deviseでNameを登録するのに必要な記述
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :phone_number, :post_number, :prefectures, :city, :block])
    devise_parameter_sanitizer.permit(:account_update, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana,:phone_number, :post_number, :prefectures, :city, :block])
  end

end



