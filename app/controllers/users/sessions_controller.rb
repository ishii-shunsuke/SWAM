# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # before_action :configure_sign_in_params, only: [:create]
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    session[:product_id] = params[:product_id]
    session[:number] = params[:number]
    respond_with(resource, serialize_options(resource))
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    if session[:product_id].nil?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      cart = Cart.new(product_id:session[:product_id], user_id: current_user.id, number: session[:number])
      cart.save
      logger.debug cart.errors.inspect
      session[:product_id] = nil
      session[:number] = nil
      respond_with resource, location: after_sign_in_before_cart_path_for(resource)
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end