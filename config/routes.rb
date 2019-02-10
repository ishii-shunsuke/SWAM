Rails.application.routes.draw do
  devise_for :users
	root 'users#new'
	get '/order/set_address', to:'users/orders#set_address'
	get '/order/confirmation/:shipping_address_id', to:'users/orders#new'
	get '/order/complete', to:'users/orders#show'
	get '/shipping_address/index', to:'users/shipping_addresses#index'
	get '/shipping_address/new', to:'users/shipping_addresses#new'
	get '/shipping_address/:id/edit', to:'users/shipping_addresses#edit'
end
