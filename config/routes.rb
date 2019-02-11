Rails.application.routes.draw do
  devise_for :users
	root 'users/products#top'
	get '/admins/top', to:'admins/products#top'
	get '/order/set_address', to:'users/orders#set_address'
	get '/order/confirmation/:shipping_address_id', to:'users/orders#new'
	get '/order/complete', to:'users/orders#show'
	get '/order_address/new', to:'users/shipping_addresses#new_when_order'
	namespace :users do
		resources :shipping_addresses
		resources :products, only: [:index, :show]
	end
	resources :carts, only: [:index, :create, :update, :destroy]
	namespace :admins do
		resources :users, only: [:index, :show, :edit ,:update, :destroy]
		resources :products
		resources :orders, only: [:index, :update]
	end
end