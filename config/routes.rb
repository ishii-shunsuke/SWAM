Rails.application.routes.draw do
<<<<<<< Updated upstream

=======
<<<<<<< HEAD
　　devise_for :users
=======
  devise_for :users
>>>>>>> 5daf07961a676d894b610a74c8e8f2266492ea46
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
>>>>>>> Stashed changes
end
