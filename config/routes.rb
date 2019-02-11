Rails.application.routes.draw do
  devise_for :users
	root 'users#new'
	get '/order/set_address', to:'users/orders#set_address'
	get '/order/confirmation/:shipping_address_id', to:'users/orders#new'
	get '/order/complete', to:'users/orders#show'
	namespace :users do
		resources :shipping_addresses
	end
	get '/order_address/new', to:'users/shipping_addresses#new_when_order'
end
